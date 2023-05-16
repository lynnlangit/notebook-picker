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
        "cost_per_hour": 0.07,
        "gpu_type": None,
    },
    {
        "name": "n1-standard-2",
        "vcpus": 2,
        "memory": 7.5,
        "gpus": None,
        "cost_per_hour": 0.14,
        "gpu_type": None,
    },
    {
        "name": "n1-standard-4",
        "vcpus": 4,
        "memory": 15,
        "gpus": None,
        "cost_per_hour": 0.28,
        "gpu_type": None,
    },
    {
        "name": "n1-standard-8",
        "vcpus": 8,
        "memory": 30,
        "gpus": None,
        "cost_per_hour": 0.55,
        "gpu_type": None,
    },
    {
        "name": "n1-standard-16",
        "vcpus": 16,
        "memory": 60,
        "gpus": None,
        "cost_per_hour": 1.11,
        "gpu_type": None,
    },
    {
        "name": "n1-standard-32",
        "vcpus": 32,
        "memory": 120,
        "gpus": None,
        "cost_per_hour": 2.19,
        "gpu_type": None,
    },
     {
        "name": "n1-standard-64",
        "vcpus": 64,
        "memory": 240,
        "gpus": None,
        "cost_per_hour": 4.37,
        "gpu_type": None,
    },
    {
        "name": "n1-standard-96",
        "vcpus": 96,
        "memory": 360,
        "gpus": None,
        "cost_per_hour": 6.56,
        "gpu_type": None,
    },
    {
        "name": "n1-standard-8",
        "vcpus": 8,
        "memory": 30,
        "gpus": 1,
        "cost_per_hour": 1.05,
        "gpu_type": "NVIDIA Tesla T4",
    },
    {
        "name": "n1-standard-16",
        "vcpus": 16,
        "memory": 60,
        "gpus": 2,
        "cost_per_hour": 2.12,
        "gpu_type": "NVIDIA Tesla T4",
    },
    {
        "name": "n1-standard-32",
        "vcpus": 32,
        "memory": 120,
        "gpus": 4,
        "cost_per_hour": 4.05,
        "gpu_type": "NVIDIA Tesla T4",
    },
    {
        "name": "a2-highgpu-1g",
        "vcpus": 12,
        "memory": 85,
        "gpus": 1,
        "cost_per_hour": .74,
        "gpu_type": "NVIDIA A100",
    },
    {
        "name": "a2-highgpu-2g",
        "vcpus": 24,
        "memory": 170,
        "gpus": 2,
        "cost_per_hour": 1.48,
        "gpu_type": "NVIDIA A100",
    },
    {
        "name": "a2-highgpu-4g",
        "vcpus": 48,
        "memory": 340,
        "gpus": 4,
        "cost_per_hour": 2.96,
        "gpu_type": "NVIDIA A100",
    },
    {
        "name": "a2-highgpu-8g",
        "vcpus": 96,
        "memory": 680,
        "gpus": 8,
        "cost_per_hour": 5.92,
        "gpu_type": "NVIDIA A100",
    },
    {
        "name": "n1-highmem-2",
        "vcpus": 2,
        "memory": 13,
        "gpus": None,
        "cost_per_hour": 0.16,
        "gpu_type": None,
    },
    {
        "name": "n1-highmem-4",
        "vcpus": 4,
        "memory": 26,
        "gpus": None,
        "cost_per_hour": 0.31,
        "gpu_type": None,
    },
    {
        "name": "n1-highmem-8",
        "vcpus": 8,
        "memory": 52,
        "gpus": None,
        "cost_per_hour": 0.61,
        "gpu_type": None,
    },
    {
        "name": "n1-highmem-16",
        "vcpus": 16,
        "memory": 104,
        "gpus": None,
        "cost_per_hour": 1.22,
        "gpu_type": None,
    },
    {
        "name": "n1-highmem-32",
        "vcpus": 32,
        "memory": 208,
        "gpus": None,
        "cost_per_hour": 2.45,
        "gpu_type": None,
    },
    {
        "name": "n1-highmem-64",
        "vcpus": 64,
        "memory": 416,
        "gpus": None,
        "cost_per_hour": 4.86,
        "gpu_type": None,
    },
    {
        "name": "n1-highmem-96",
        "vcpus": 96,
        "memory": 624,
        "gpus": None,
        "cost_per_hour": 7.32,
        "gpu_type": None,
    },
]
gpu_types = [
    {
        "name": "NVIDIA Tesla P4",
        "instance_family": "n1",
        "max_cost_per_hour": 0.66,
        "max_number_of_gpus": 4,
        "usage": "ML Inference, Training",
    },
    {
        "name": "NVIDIA T4",
        "instance_family": "n1",
        "max_cost_per_hour": 0.49,
        "max_number_of_gpus": 4,
        "usage": "ML Inference, Training",
    },
    {
        "name": "NVIDIA A100",
        "instance_family": "a2",
        "max_cost_per_hour": 3.93, 
        "max_number_of_gpus": 8,
        "usage": "Large models with massive data tables",
    },
    {
        "name": "NVIDIA V100",
        "instance_family": "n1",
        "max_cost_per_hour": 2.48,
        "max_number_of_gpus": 8,
        "usage": "ML Training, Inference, HPC",
    },
    {
        "name": "NVIDIA Tesla P100",
        "instance_family": "n1",
        "max_cost_per_hour": 1.46,
        "max_number_of_gpus": 8,
        "usage": "ML Training, Inference, HPC",   
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
        return [
            machine_configuration
            for machine_configuration in machine_configurations
            if machine_configuration["gpus"] is None
        ]

@app.route("/")
def index():
    gpu_rows = []
    no_gpu_rows = []
    for row in machine_configurations:
        if row["gpus"] is not None:
            gpu_rows.append([row["name"], row["vcpus"], row["memory"], row["gpus"], row["gpu_type"],row["cost_per_hour"]])
        else:
            no_gpu_rows.append([row["name"], row["vcpus"], row["memory"], row["gpus"], row["gpu_type"],row["cost_per_hour"]])
    selected_row = machine_configurations[0]
    return render_template("index.html", gpu_types=gpu_types,gpu_rows=gpu_rows, no_gpu_rows=no_gpu_rows, submit_button_text="Submit", machine_types=machine_configurations, selected_row=selected_row)

@app.route("/select", methods=["POST"])
def select():
    machine_configuration_name = request.form["machine_configuration_name"]

    for machine_configuration in machine_configurations:
        if machine_configuration["name"] == machine_configuration_name:
            break

    return render_template("selected.html", machine_configuration=machine_configuration)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
