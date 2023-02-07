// Import the KNN classifier from the library
const { KNN } = require("ml.js");

// Prepare your training data
const trainingData = [
  {input: [0, 0], output: [0]},
  {input: [0, 1], output: [0]},
  {input: [1, 0], output: [0]},
  {input: [1, 1], output: [1]}
];

// Create a new KNN classifier
const knn = new KNN();

// Train the classifier on the training data
knn.train(trainingData);

// Use the classifier to predict the output for new data
const prediction = knn.predict([2, 2]);

// Output the prediction
console.log(prediction);
