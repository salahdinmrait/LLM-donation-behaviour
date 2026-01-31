import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as stats
import pingouin as pg
import os

# Set style
sns.set_theme(style="whitegrid")

def load_and_preprocess(filepath):
    print(f"Loading data from {filepath}...")
    df = pd.read_csv(filepath)
    
    # Check for duplicates
    duplicates = df.duplicated(subset=['participant_id', 'post_id'])
    print(f"Duplicate participant-message combinations: {duplicates.sum()}")
    
    # Check for missing values
    missing = df.isnull().sum()
    print("Missing values:\n", missing[missing > 0])
    
    # Compute persuasiveness composite score
    persuasiveness_cols = ['persuasiveness_1', 'persuasiveness_2', 'persuasiveness_3']
    df['persuasiveness'] = df[persuasiveness_cols].mean(axis=1)
    
    # Calculate Cronbach's alpha
    alpha = pg.cronbach_alpha(data=df[persuasiveness_cols])
    print(f"Cronbach's alpha for persuasiveness: {alpha[0]:.3f}")
    
    return df

def analyze_descriptive(df):
    print("\n--- Descriptive Statistics ---")
    
    # Engagement
    print("\nEngagement Distribution by Gender and Content Source:")
    engagement_counts = df.groupby(['gender', 'content_source', 'rating']).size().unstack(fill_value=0)
    print(engagement_counts)
    
    # Persuasiveness
    print("\nPersuasiveness Stats by Gender and Content Source:")
    pers_stats = df.groupby(['gender', 'content_source'])['persuasiveness'].agg(['mean', 'std', 'median', 'min', 'max'])
    print(pers_stats)
    
    # Donation Amount
    print("\nDonation Amount Stats by Gender and Content Source:")
    don_stats = df.groupby(['gender', 'content_source'])['donation_amount'].agg(['mean', 'std', 'median', 'min', 'max'])
    print(don_stats)
    
    # Zero Donations
    print("\nProportion of Zero Donations:")
    zero_donations = df.groupby(['gender', 'content_source'])['donation_amount'].apply(lambda x: (x == 0).mean())
    print(zero_donations)

    # Overall Stats
    print("\n--- Overall Statistics ---")
    print("Engagement Overall:")
    print(df['rating'].value_counts())
    print("\nPersuasiveness Overall:")
    print(df['persuasiveness'].describe())
    print("\nDonation Amount Overall:")
    print(df['donation_amount'].describe())
    print("\nZero Donations Overall:")
    print((df['donation_amount'] == 0).mean())
    
    # Correlations
    print("\nCorrelations:")
    # Map engagement to numeric for correlation check (Dislike=1, Neutral=2, Like=3)
    engagement_map = {'Dislike': 1, 'Neutral': 2, 'Like': 3}
    df['engagement_numeric'] = df['rating'].map(engagement_map)
    
    corrs = df[['engagement_numeric', 'persuasiveness', 'donation_amount']].corr()
    print(corrs)
    
    return pers_stats, don_stats

def generate_visualizations(df):
    print("\nGenerating visualizations...")
    
    # 1. Engagement Bar Chart (Gender x Content Source)
    plt.figure(figsize=(10, 6))
    g = sns.catplot(
        data=df, kind="count",
        x="rating", hue="content_source", col="gender",
        palette="viridis", height=5, aspect=1
    )
    g.set_axis_labels("Engagement Rating", "Count")
    g.set_titles("{col_name}")
    plt.savefig('engagement_distribution.png')
    plt.close()
    
    # 2. Persuasiveness Box Plot (4 conditions)
    plt.figure(figsize=(10, 6))
    sns.boxplot(data=df, x='gender', y='persuasiveness', hue='content_source', palette='Set2')
    plt.title('Persuasiveness Scores by Gender and Content Source')
    plt.savefig('persuasiveness_boxplot.png')
    plt.close()

    # 3. Donation Means Bar Chart (Gender x Content Source)
    plt.figure(figsize=(10, 6))
    sns.barplot(data=df, x='gender', y='donation_amount', hue='content_source', palette='Set2', errorbar='ci')
    plt.title('Mean Donation Amount by Gender and Content Source')
    plt.ylabel('Mean Donation Amount ($)')
    plt.savefig('donation_means.png')
    plt.close()

    # 3b. Donation Histogram (for Zero-Inflation check)
    g = sns.FacetGrid(df, col="gender", row="content_source", margin_titles=True, height=4, aspect=1.5)
    g.map(sns.histplot, "donation_amount", bins=20)
    plt.savefig('donation_histogram.png')
    plt.close()
    
    # 4. Normality Checks for Persuasiveness
    # Histogram
    plt.figure(figsize=(8, 6))
    sns.histplot(df['persuasiveness'], kde=True)
    plt.title('Distribution of Persuasiveness Scores')
    plt.savefig('persuasiveness_histogram.png')
    plt.close()
    
    # Q-Q Plot
    plt.figure(figsize=(8, 6))
    stats.probplot(df['persuasiveness'], dist="norm", plot=plt)
    plt.title('Q-Q Plot of Persuasiveness Scores')
    plt.savefig('persuasiveness_qqplot.png')
    plt.close()
    
    print("Visualizations saved.")

def main():
    filepath = 'Data_LongFormat.csv'
    if not os.path.exists(filepath):
        print(f"Error: {filepath} not found.")
        return

    df = load_and_preprocess(filepath)
    analyze_descriptive(df)
    generate_visualizations(df)
    
    # Save summary to markdown
    with open('analysis_summary.md', 'w') as f:
        f.write("# Analysis Summary\n\n")
        f.write("## Reliability\n")
        alpha = pg.cronbach_alpha(data=df[['persuasiveness_1', 'persuasiveness_2', 'persuasiveness_3']])
        f.write(f"Cronbach's alpha for persuasiveness: {alpha[0]:.3f}\n\n")
        
        f.write("## Descriptive Statistics\n\n")
        
        f.write("### Engagement (Counts)\n")
        engagement_counts = df.groupby(['gender', 'content_source', 'rating']).size().unstack(fill_value=0).to_markdown()
        f.write(engagement_counts + "\n\n")

        f.write("### Persuasiveness\n")
        pers_stats = df.groupby(['gender', 'content_source'])['persuasiveness'].agg(['mean', 'std']).to_markdown()
        f.write(pers_stats + "\n\n")
        
        f.write("### Donation Amount\n")
        don_stats = df.groupby(['gender', 'content_source'])['donation_amount'].agg(['mean', 'std']).to_markdown()
        f.write(don_stats + "\n\n")
        
        f.write("### Zero Donations\n")
        zero_don = df.groupby(['gender', 'content_source'])['donation_amount'].apply(lambda x: (x == 0).mean()).to_markdown()
        f.write(zero_don + "\n\n")
        
        f.write("## Correlations\n")
        engagement_map = {'Dislike': 1, 'Neutral': 2, 'Like': 3}
        df['engagement_numeric'] = df['rating'].map(engagement_map)
        corrs = df[['engagement_numeric', 'persuasiveness', 'donation_amount']].corr().to_markdown()
        f.write(corrs + "\n\n")

if __name__ == "__main__":
    main()
