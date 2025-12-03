# Step 1: Base Image
FROM python:3.10-slim

# Step 2: Set working directory
WORKDIR /todo

# Step 3: Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy whole project
COPY . .
COPY todo_main/static/ todo_main/static/
# COPY static/ static/

# Step 5: Collect static files
RUN python manage.py collectstatic --noinput

# Step 6: Run Django with Gunicorn
CMD ["gunicorn", "todo_main.wsgi:application", "--bind", "0.0.0.0:8000"]
