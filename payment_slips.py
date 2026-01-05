
import random

def generate_workers(num_workers=400):
    workers = []
    for i in range(1, num_workers + 1):
        worker = {
            "id": i,
            "name": f"Worker_{i}",
            "gender": random.choice(["Male", "Female"]),
            "department": random.choice(["HRM", "ICT", "Finance", "Actuarial", "Marketing"]),
            "salary": random.randint(5000, 35000)
        }
        workers.append(worker)
    return workers


def generate_payment_slips(workers):
    # Print header once (Department included)
    print(f"{'ID':<5} {'Name':<12}  {'Gender':<8} {'Department':<12} {'Salary':<8} {'Level'}")
    print("-" * 65)

    for worker in workers:
        try:
            salary = worker["salary"]
            gender = worker["gender"]
            department = worker["department"]
            level = "Standard"

            if 10000 < salary < 20000:
                level = "A1"
            if 7500 < salary < 30000 and gender == "Female":
                level = "A5-F"

            print(
                f"{worker['id']:<5} "
                f"{worker['name']:<12} "
                f"{gender:<8} "
                f"{department:<12} "
                f"{salary:<8} "
                f"{level}"
            )

        except KeyError as e:
            print(f"Missing data for worker: {e}")
        except Exception as e:
            print(f"Unexpected error: {e}")


if __name__ == "__main__":
    workers = generate_workers()
    generate_payment_slips(workers)

