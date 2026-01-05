
# -----------------------------
# Generate workers
# -----------------------------
generate_workers <- function(num_workers = 400) {

  workers <- data.frame(
    id = 1:num_workers,
    name = paste0("Worker_", 1:num_workers),
    gender = sample(c("Male", "Female"), num_workers, replace = TRUE),
    department = sample(
      c("HRM", "ICT", "Finance", "Actuarial", "Marketing"),
      num_workers,
      replace = TRUE
    ),
    salary = sample(5000:35000, num_workers, replace = TRUE),
    stringsAsFactors = FALSE
  )

  return(workers)
}

# -----------------------------
# Generate payment slips
# -----------------------------
generate_payment_slips <- function(workers) {

  # Print header once
  cat(
    sprintf(
      "%-5s %-12s %-8s %-12s %-8s %s\n",
      "ID", "Name", "Gender", "Department", "Salary", "Level"
    )
  )
  cat(paste(rep("-", 65), collapse = ""), "\n")

  for (i in seq_len(nrow(workers))) {

    tryCatch({

      salary <- workers$salary[i]
      gender <- workers$gender[i]
      department <- workers$department[i]
      level <- "Standard"

      if (salary > 10000 && salary < 20000) {
        level <- "A1"
      }

      if (salary > 7500 && salary < 30000 && gender == "Female") {
        level <- "A5-F"
      }

      cat(
        sprintf(
          "%-5d %-12s %-8s %-12s %-8d %s\n",
          workers$id[i],
          workers$name[i],
          gender,
          department,
          salary,
          level
        )
      )

    }, error = function(e) {
      cat("Unexpected error:", e$message, "\n")
    })
  }
}

# -----------------------------
# Main execution
# -----------------------------
workers <- generate_workers()
generate_payment_slips(workers)

