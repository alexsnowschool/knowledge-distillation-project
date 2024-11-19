import mlflow
import mlflow.sklearn
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.datasets import load_iris

def train_and_log_model():
    # Set the MLflow tracking URI
    mlflow.set_tracking_uri("http://127.0.0.1:5001")

    # Load the Iris dataset
    iris = load_iris()
    X_train, X_test, y_train, y_test = train_test_split(iris.data, iris.target, test_size=0.2, random_state=42)

    # Set the experiment name
    mlflow.set_experiment("Iris RandomForest Experiment")

    with mlflow.start_run():
        # Set parameters
        n_estimators = 100
        max_depth = 3
        mlflow.log_param("n_estimators", n_estimators)
        mlflow.log_param("max_depth", max_depth)

        # Train a RandomForest model
        model = RandomForestClassifier(n_estimators=n_estimators, max_depth=max_depth, random_state=42)
        model.fit(X_train, y_train)

        # Make predictions
        predictions = model.predict(X_test)
        accuracy = accuracy_score(y_test, predictions)

        # Log metrics
        mlflow.log_metric("accuracy", accuracy)

        # Log the model
        mlflow.sklearn.log_model(model, "random_forest_model")

        print(f"Model accuracy: {accuracy}")

if __name__ == "__main__":
    train_and_log_model()