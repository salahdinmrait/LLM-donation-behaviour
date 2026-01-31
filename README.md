# LLM Donation Behaviour

Bachelor's thesis project investigating how LLM-generated content affects donation behaviour and persuasiveness.

## Project Structure

- **Data**
  - `Data_LongFormat.csv` - Processed data in long format
  - `Data_Raw.csv` - Raw experimental data

- **Analysis**
  - `analysis_phase2.R` - Main effects analysis (mixed-effects models)
  - `analysis_phase3.R` - Interaction analysis
  - `analysis.py` - Supplementary Python analysis

- **Results**
  - `phase2_results.txt` - Main effects results
  - `phase3_results.txt` - Interaction results
  - `interaction_*.png` - Interaction plots

- **Thesis**
  - `thesis_source/` - LaTeX source files
  - `Thesis_final.pdf` - Final thesis document

- **Presentation**
  - `thesis_presentation.html` - Interactive HTML presentation
  - `thesis_presentation.pptx` - PowerPoint version
  - `presentation_script.md` - Presentation script

## Methods

The analysis uses mixed-effects models with random intercepts for participants and posts:
- **Engagement**: Ordinal logistic mixed-effects regression (clmm)
- **Persuasiveness**: Linear mixed-effects regression (lmer)
- **Donation**: Hurdle mixed-effects model (glmmTMB)

## Author

Salahdin Mraït - Tilburg University
