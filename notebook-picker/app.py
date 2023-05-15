import os
import sys
from flask import Flask, render_template, request

app = Flask(__name__, template_folder="templates")

machine_configurations = [
    {
        "name": "n1-standard-1",
        "vcpus": 1,
        "memory": 3.75,
        "gpus": None,
        "cost_per_hour": 0.05,
    },
    {
        "name": "n1-standard-2",
        "vcpus": 2,
        "memory": 7.5,
        "gpus": None,
        "cost_per_hour": 0.10,
    },
    {
        "name": "n1-standard-4",
        "vcpus": 4,
        "memory": 15,
        "gpus": None,
        "cost_per_hour": 0.20,
    },
    {
        "name": "n1-standard-8",
        "vcpus": 8,
        "memory": 30,
        "gpus": None,
        "cost_per_hour": 0.40,
    },
    {
        "name": "n1-standard-16",
        "vcpus": 16,
        "memory": 60,
        "gpus": None,
        "cost_per_hour": 0.80,
    },
    {
        "name": "n1-standard-32",
        "vcpus": 32,
        "memory": 120,
        "gpus": None,
        "cost_per_hour": 1.60,
    },
    {
        "name": "n1-standard-8-gpu",
        "vcpus": 8,
        "memory": 30,
        "gpus": 1,
        "cost_per_hour": 1.00,
        "gpu_type": "NVIDIA Tesla T4",
    },
    {
        "name": "n1-standard-16-gpu",
        "vcpus": 16,
        "memory": 60,
        "gpus": 2,
        "cost_per_hour": 2.00,
        "gpu_type": "NVIDIA Tesla T4",
    },
    {
        "name": "n1-standard-32-gpu",
        "vcpus": 32,
        "memory": 120,
        "gpus": 4,
        "cost_per_hour": 4.00,
        "gpu_type": "NVIDIA Tesla T4",
    },
]

def get_machine_configurations(with_gpus=False):
    if with_gpus:
        return [
            machine_configuration
            for machine_configuration in machine_configurations
            if machine_configuration["gpus"] is not None
        ]
    else:
        return machine_configurations

@app.route("/")
def index():
    rows = []
    for row in machine_configurations:
        rows.append([row["name"], row["vcpus"], row["memory"], row["gpus"], row["cost_per_hour"]])
    return render_template("index.html", rows=rows, submit_button_text="Submit", machine_types=machine_configurations)

@app.route("/select", methods=["POST"])
def select():
    machine_configuration_name = request.form["machine_configuration_name"]

    for machine_configuration in machine_configurations:
        if machine_configuration["name"] == machine_configuration_name:
            break

    return render_template("selected.html", machine_configuration=machine_configuration)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
