FROM python:3.11

# Set up a new user named "user" with user ID 1000 for permission
RUN useradd -m -u 1000 user
# Switch to the "user" user
USER user
# Set home to the user's home directory
ENV HOME=/home/user \
	PATH=/home/user/.local/bin:$PATH

# Install poetry
RUN curl -sSL https://install.python-poetry.org/ | python -

# Install dependencies using poetry
COPY pyproject.toml poetry.lock ./
RUN poetry install --no-dev

COPY --chown=user *.py *.css /

ENTRYPOINT ["poetry", "run", "solara", "run", "wanderlust.py", "--host=0.0.0.0", "--port", "7860"]