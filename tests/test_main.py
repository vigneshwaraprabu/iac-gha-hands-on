import app.main as main
from unittest.mock import patch

@patch("app.config.get_config")
def test_hello(mock_get_config):
    mock_get_config.return_value = "test-value"
    response = main.hello()
    assert "test-value" in response
