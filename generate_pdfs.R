# this script is only needed to generate pdf slide output
# requires that html output is present
pagedown::chrome_print("lect04_StatReview/lect04_StatReview.html", timeout=1000)
pagedown::chrome_print("lect05_TwoGroupComp/lect05_TwoGroupComp.html", timeout=1000)
pagedown::chrome_print("lect06_ANOVA/lect06_ANOVA.html", timeout=1000)
pagedown::chrome_print("lect07_LinearModels/lect07_LinearModels.html", timeout=1000)
