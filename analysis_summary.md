# Analysis Summary

## Reliability
Cronbach's alpha for persuasiveness: 0.942

## Descriptive Statistics

### Engagement (Counts)
|                     |   Dislike |   Like |   Neutral |
|:--------------------|----------:|-------:|----------:|
| ('Female', 'Human') |        98 |    709 |       282 |
| ('Female', 'LLM')   |        65 |    813 |       211 |
| ('Male', 'Human')   |       110 |    690 |       286 |
| ('Male', 'LLM')     |       100 |    753 |       233 |

### Persuasiveness
|                     |    mean |     std |
|:--------------------|--------:|--------:|
| ('Female', 'Human') | 4.92899 | 1.71994 |
| ('Female', 'LLM')   | 5.17784 | 1.64138 |
| ('Male', 'Human')   | 4.87446 | 1.6586  |
| ('Male', 'LLM')     | 5.08134 | 1.60556 |

### Donation Amount
|                     |      mean |       std |
|:--------------------|----------:|----------:|
| ('Female', 'Human') | 0.0127916 | 0.0181222 |
| ('Female', 'LLM')   | 0.014977  | 0.0198344 |
| ('Male', 'Human')   | 0.012186  | 0.0177654 |
| ('Male', 'LLM')     | 0.0130331 | 0.0180587 |

### Zero Donations
|                     |   donation_amount |
|:--------------------|------------------:|
| ('Female', 'Human') |          0.357208 |
| ('Female', 'LLM')   |          0.310376 |
| ('Male', 'Human')   |          0.380295 |
| ('Male', 'LLM')     |          0.362799 |

## Correlations
|                    |   engagement_numeric |   persuasiveness |   donation_amount |
|:-------------------|---------------------:|-----------------:|------------------:|
| engagement_numeric |             1        |         0.486029 |          0.147771 |
| persuasiveness     |             0.486029 |         1        |          0.193678 |
| donation_amount    |             0.147771 |         0.193678 |          1        |

