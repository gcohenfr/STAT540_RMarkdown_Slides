
class: middle
## Increasing the complexity of the linear model ...

### What if you have two categorical variables?
<Big>
  
  e.g., `gType` and `devStage` <font size=3>
    (for simplicity, let's consider only E16 and 4W)</font>

> Is the assocation between gene expression and genotype different at different developmental stages?

![](L6_ANOVA_files/slide32.png)


---
class: middle
```{r,echo=FALSE, include=FALSE}
##########################################################
## simplying devStage to first and last timepoints
##########################################################
prDes <- 
  droplevels(subset(prDes,
                    subset = devStage %in%
                      levels(devStage)[c(1, nlevels(devStage))]))
str(prDes) # 15 obs. of  4 variables
prDat <- subset(prDat, select = prDes$sidChar)

# Gene selected for illustration
(luckyGene <- which(rownames(prDat) == "1455695_at")) # 26861
twoDat <- data.frame(gExp = unlist(prDat[luckyGene, ]))
twoDat <- data.frame(prDes, twoDat)
twoDat$grp <- with(twoDat, interaction(gType, devStage))
str(twoDat)
with(twoDat, table(gType, devStage))
table(twoDat$grp)
```

## Two-way ANOVA or regression with interaction 

### What parameters are we estimating? 

### What hypotheses are we testing?

```{r}
twoFactFit <- lm(gExp ~ gType * devStage, twoDat)
summary(twoFactFit)$coeff
```
---
class: middle
![](L6_ANOVA_files/slide33.png)

```{r,echo=F,highlight.output = c(2)}
twoFactFit <- lm(gExp ~ gType * devStage, twoDat)
summary(twoFactFit)$coeff
```
---
class: middle
$$ Y_{ijk}=\theta+\tau_i+\tau_{B}$$

model parameter | R | stats
--------|---------|---------
$\theta$ | (Intercept) | $E[Y_{wt,E16}]$
$\tau_A$ | gTypeNrlKO | *conditional* effect of NrlKO *at* E16
$\tau_B$ | devStage4_weeks | *conditional* effect of 4_weeks *at* WT
$\tau_{AB}$ | gTypeNrlKO:devStage4_weeks | *interaction* effect of NrlKO and 4_weeks
---
---
class: middle
![](L6_ANOVA_files/slide34.png)

```{r,echo=F,highlight.output = c(3)}
twoFactFit <- lm(gExp ~ gType * devStage, twoDat)
summary(twoFactFit)$coeff
```
---
class: middle
![](L6_ANOVA_files/slide35.png)

```{r,echo=F,highlight.output = c(4)}
twoFactFit <- lm(gExp ~ gType * devStage, twoDat)
summary(twoFactFit)$coeff
```

---
class: middle
![](L6_ANOVA_files/slide36.png)

```{r,echo=F,highlight.output = c(5)}
twoFactFit <- lm(gExp ~ gType * devStage, twoDat)
summary(twoFactFit)$coeff
```

---
class: middle
![](L6_ANOVA_files/slide37.png)
---
class: middle
![](L6_ANOVA_files/slide38.png)
---
class: middle

## Let's go through some example genes to get a sense of what an interaction effect looks like.
     
     We have three parameters we'd like to interpret:
.pull-left[
> ### Main effect: genotype
### Main effect: age
### Interaction: genotype*age
]
.pull-right[
<br>
![](L6_ANOVA_files/slide39.png)
]

---
class: middle
![](L6_ANOVA_files/slide40.png)
---
class: middle
![](L6_ANOVA_files/slide41.png)
---
class: middle
![](L6_ANOVA_files/slide42.png)
---
class: middle
![](L6_ANOVA_files/slide43.png)
---
class: middle
![](L6_ANOVA_files/slide44.png)
