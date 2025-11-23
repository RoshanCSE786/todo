# Step 1: Base Image
FROM python:3.10-slim

# Step 2: Set working directory
WORKDIR /todo

# Step 3: Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy whole project
COPY . .

# Step 5: Run Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
