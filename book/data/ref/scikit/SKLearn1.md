
# Supervised learning

 in which the data comes with additional attributes that we want to predict (Click here to go to the scikit-learn supervised learning page).This problem can be either:
## Regression
Predicting a continuous-valued attribute associated with an object.
Applications: Drug response, Stock prices.
Algorithms: 

SVR, ridge regression, Lasso, ...

* Least Squares
  * Ordinary
  * Partial
* Ridge
* Lasso
* Elastic Net
* Least Angle
* LARS Lasso
* Orthogonal Matching Pursuit (OMP)
* Bayesian
* Bayesian Ridge
* Automatic Relevance Determination
* Logisitic
* Stochastic Gradient Descent - SGD
* Perceptron
* Ransac
* Rigdg
* Support Vector Machine
* Gaussian
  * Corrlation
  * GPC
  * GPR

## Classification

Identifying to which category an object belongs to.
Applications: Spam detection, Image recognition.

samples belong to two or more classes and we want to learn from already labeled data how to predict the class of unlabeled data. An example of classification problem would be the handwritten digit recognition example, in which the aim is to assign each input vector to one of a finite number of discrete categories. Another way to think of classification is as a discrete (as opposed to continuous) form of supervised learning where one has a limited number of categories and for each of the n samples provided, one is to try to label them with the correct category or class.

Algorithms: 

SVM, nearest neighbors, random forest, ...

* Support Vector Machines
* Density estimation, novelty detection
* Kernel functions
  * Correlation
* Stochastic Gradient Descent - SGD
* Nearest Neighbors
  * Brute Force
  * KD-Tree
  * Ball Tree
* Cenroid
  * Nearest Centroid Classifier
  * Nearest Shrunken Centroid
* Naive Bayes
  * Basic
  * Gausian
  * Multinomial
  * Bernoulli
* Desision Tree
 * Classification
 * Regression
* Ensemble Methods
  * Forests of randomized trees
  * Random Forests
  * Extremely Randomized Trees
* Voting Classifier
* Gradient Tree Boosting
* Multi Class and Multi Label
  * One-Vs-The-On
  * One-Vs-The-All
  * One-Vs-The-Rest
* Feature Selection  
* Label Propagation
* Discriminant Analysis
  * Linear
* * Dimensionality Reduction
  * Quadradic

# Unsupervised Learning

n which the training data consists of a set of input vectors x without any corresponding target values. The goal in such problems may be to discover groups of similar examples within the data, where it is called clustering, or to determine the distribution of data within the input space, known as density estimation, or to project the data from a high-dimensional space down to two or three dimensions for the purpose of visualization 

## Clustering

Automatic grouping of similar objects into sets.
Applications: Customer segmentation, Grouping experiment outcomes
Algorithms: 

k-Means, spectral clustering, 

* K-Means
* Affinity Propagation
* Mean Shift
* Spectral 
* Hierarchical* Dbscan
* Gaussian Mixture
* Dirichlet Process
* Other
  * BiCluster
  * Birch
* Evaluation
  * Intertia
  * Adjust Rand Index
  * Mutual Information based scores
  * Homogeneity
  * Completeness
  * V-Measure
  * Silhouette Coefficient

## Dimensionality

Reducing the number of random variables to consider.

PCA, feature selection, non-negative matrix factorization.
    
* Principal component analysis (PCA)
  * Probabilistic
  * Approximate
  * Randomized
  * Kernel
  * Sparse
  * Dictionary Learning
  * Independent component analysis

* Manifold Learning 
* Isomap
* Locally Linear Embedding
* Hessian Eigenmapping
* Local Tangent Space Alignment
* Multi-dimensional Scaling (MDS)

* Factor Analysis
* Decomposition
  * Cross
  * Truncated
  * NMF
  * CDNMF?

* Base
 * Non-negative matrix factorization

# Other
 
## Covariance
* Robust
* Minimum
* Skunk
* Outlier
* Empirical
* Graph Lasso

## Detection
* Novelty
* Outlier 
* Fitting an elliptic envelop



 * Markov
   * Hidden
   
## Model Selection

    Comparing, validating and choosing parameters and models.
    Goal: Improved accuracy via parameter tuning
    Modules: 

    grid search, cross validation, metrics.


* Cross-Validation
  * K-fold
  * Stratified K-Fold
  * Leave-One-Out - LOO
  * Leave-P-Out - LPO
  * Leave-One-Label-Out - LOLO
  * Leave-P-Label-Out
  * Shuffle Split
  * Bootstrapping
  * Model specific
  
* Grid Search
* Pipeline: chaining estimators

## Preprocess

    Feature extraction and normalization.
    Application: Transforming input data such as text for use with machine learning algorithms.
    Modules: 

    preprocessing, feature extraction.

  * Standardization
  * Mean Removal
  * Variance Scaling
  * Sparse input
  * Normalization
  * Feature Selection
* * Base
* * From Model
* * Mutural Info
* * Univariate Selection
* * Variance Threshould
  * Feature Extraction 
* * Binarization
* * Extraction
* * Text 
* * Vectorizer
* * TF-IDF normalization
* * Image
* * Hashing
* * Image
  * Label 
* * Binarization
* * Encoding

## Kernel

* Radial Basis
* Additive Chi Squared
* Skewed Chi Squared

## Collect
* General API
* Toy
* Sample Images
* Generators
* svmlight / libsvm
* Olivetti faces
* 20 newsgroups text
* mldata.org
* Labeled Faces

# Sklearn Reference

* cluster: Clustering  * Classes  * Functions* covariance: Covariance Estimators* cross_validation: Cross Validation* datasets: Datasets  * Loaders  * Samples generator* decomposition: Matrix Decomposition* ensemble: Ensemble Methods* feature_extraction: Feature Extraction  * From images  * From text* feature_selection: Feature Selection* gaussian_process: Gaussian Processes* grid_search: Grid Search* hmm: Hidden Markov Models* kernel_approximation Kernel Approximation* semi_supervised Semi-Supervised Learning* lda: Linear Discriminant Analysis* linear_model: Generalized Linear Models  * For dense data  * For sparse data* manifold: Manifold Learning* metrics: Metrics  * Classification metrics  * Regression metrics  * Clustering metrics  * Pairwise metrics* mixture: Gaussian Mixture Models* multiclass: Multiclass and multilabel classification  * Multiclass and multilabel classification strategies* naive_bayes: Naive Bayes* neighbors: Nearest Neighbors* pls: Partial Least Squares* pipeline: Pipeline* preprocessing: Preprocessing and Normalization* qda: Quadratic Discriminant Analysis* svm: Support Vector Machines  * Estimators  * Low-level methods* tree: Decision Trees* utils: Utilities

# SciPy

* constants: physical constants and conversion factors (since version 
* cluster: hierarchical clustering, vector quantization, K-means
* fftpack: Discrete Fourier Transform algorithms
* integrate: numerical integration routines
* interpolate: interpolation tools
* io: data input and output
* lib: Python wrappers to external libraries
* linalg: linear algebra routines
* misc: miscellaneous utilities (e.g. image reading/writing)
* ndimage: various functions for multi-dimensional image processing
* optimize: optimization algorithms including linear programming
* signal: signal processing tools
* sparse: sparse matrix and related algorithms
* spatial: KD-trees, nearest neighbors, distance functions
* special: special functions
* stats: statistical functions
* weave: tool for writing C/C++ code as Python multiline strings





