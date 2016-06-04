## the 1st principal components PC1 is the linear combination of the x with coefficient e1 which is the 1st eigen vector
## pc1 = e1x ; e1 is the 1st eignen vector of the 1st eigen value (lambda 1) 
## pc2 = e2x ; e2 is the 2nd eignen vector of the 2st eigen value (lambda 2)
## ...; if the original A matrix has n rows &  m columns (m varialbes forms the x); B matrix has m*m diagnoal matrix that is the cov or cor
## of the matrix A; thus B has the m eigen value lamda1 >= lambda2 >= ...>= lambdam >0;
## use the iris data set for demonstrating the PCA 
iris_cov <- cov(iris[,1:4])  # Due to only numeric type is allowed, thus only use the numeric column as the A matrix
iris_cov_eigen <- eigen(iris_cov)
iris_cov_eigen
#$values
#[1] 4.22824171 0.24267075 0.07820950 0.02383509 
#
#$vectors
#            [,1]        [,2]        [,3]       [,4]
#[1,]  0.36138659 -0.65658877 -0.58202985  0.3154872
#[2,] -0.08452251 -0.73016143  0.59791083 -0.3197231
#[3,]  0.85667061  0.17337266  0.07623608 -0.4798390
#[4,]  0.35828920  0.07548102  0.54583143  0.7536574
## validate the equation of [B]*v1 = lambda*v1 
iris_cov%*%iris_cov_eigen$vectors[,1]
#                   [,1]
#Sepal.Length  1.5280299
#Sepal.Width  -0.3573816
#Petal.Length  3.6222104
#Petal.Width   1.5149333

## product of the 1st eigen value cross the 1st vector(lambda*v)
iris_cov_eigen$values[1]%*%iris_cov_eigen$vectors[,1]
#[1]  1.5280299 -0.3573816  3.6222104  1.5149333

## it will produce the pc1= 0.36138659*Sepal.Length-0.08452251*Sepal.Width+0.85667061*Petal.Length+0.35828920*Petal.Width with eigen value 4.22824171
## The result is the same with loadings if use the default function princomp
iris_princomp <- princomp(iris[,1:4],cor = FALSE)
iris_princomp$loadings

#Loadings:
#             Comp.1 Comp.2 Comp.3 Comp.4
#Sepal.Length  0.361 -0.657 -0.582  0.315
#Sepal.Width         -0.730  0.598 -0.320
#Petal.Length  0.857  0.173        -0.480
#Petal.Width   0.358         0.546  0.754
## Scores data indicates each observation will reproduce a new value according to each derived components
