def run_slather
  slather.configure('Melaka.xcodeproj', 'Melaka', options: {
    ignore_list: [
      '**/*View.swift'
    ],
    decimals: 2
  })
  slather.notify_if_coverage_is_less_than(minimum_coverage: 80)
  slather.notify_if_modified_file_is_less_than(minimum_coverage: 60)
  slather.show_coverage
end

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# swiftlint
swiftlint.lint_files

# slather
run_slather
