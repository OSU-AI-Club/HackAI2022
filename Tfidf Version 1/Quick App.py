import os
import nltk
import pickle
from nltk.corpus import stopwords
import re
# Load model and vectorizer
model = pickle.load(open('Model_pacTextOnly.pkl', 'rb'))
tfidfvect = pickle.load(open('Vectorizer_pacTextOnly.pkl', 'rb'))
# Build functionalities
def predict(text):
    review = re.sub('[^a-zA-Z]', ' ', text)
    review_vect = tfidfvect.transform([review])
    prediction = model.predict(review_vect)
    return prediction
os.system('clear')
print("Input file path: ")
with open(input(), 'r') as file:
    data = file.read().replace('\n', ' ').lower()
while (data != ""):
    print("Model predicts text is ", predict(data), "\nPress enter to continue...")
    input()
    os.system('clear')
    print("Input file path: ")
    with open(input(), 'r') as file:
        data = file.read().replace('\n', ' ').lower()
