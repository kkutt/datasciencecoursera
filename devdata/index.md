---
title       : Training/test proportion and decision tree accuracy
subtitle    : Developing Data Products
author      : Rubik
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Problem assesed in my application

How data partition proportion influences machine learning algorithm accuracy?

--- 

## Method

1. Iris dataset is loaded
2. User can select how many cases from dataset go to training set (others go to testing set)
3. Simple decision tree model is trained on training dataset
4. Model is evaluated on testing dataset
5. Accuracy is presented to user

--- 

## Sample of results presented in application

In my application user can see how trained decision tree looks like, e.g.:


```
## n= 105 
## 
## node), split, n, loss, yval, (yprob)
##       * denotes terminal node
## 
## 1) root 105 70 setosa (0.3333333 0.3333333 0.3333333)  
##   2) Petal.Length< 2.45 35  0 setosa (1.0000000 0.0000000 0.0000000) *
##   3) Petal.Length>=2.45 70 35 versicolor (0.0000000 0.5000000 0.5000000)  
##     6) Petal.Width< 1.75 38  4 versicolor (0.0000000 0.8947368 0.1052632) *
##     7) Petal.Width>=1.75 32  1 virginica (0.0000000 0.0312500 0.9687500) *
```

__NOTE__: This decision tree was created during slidifying the presentation.

--- 

## Thank you for your attention!

