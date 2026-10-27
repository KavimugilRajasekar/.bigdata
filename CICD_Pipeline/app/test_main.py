from main import hello

def test_hello():
    assert hello() == "Application is running successfully!"
    print("Test Passed!")

if __name__ == "__main__":
    test_hello()
