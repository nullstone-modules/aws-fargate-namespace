# 0.3.0 (Oct 14, 2026)
* Recorded ECS task state-change events for preview clusters in a `<cluster>-executions` CloudWatch log group so Nullstone can show task-app execution history past ECS's one-hour retention.
* Added `executions_retention_in_days` (default 90, preview clusters only) and output `executions_log_group_name`, which passes through from the connected cluster outside preview environments.
* Granted preview deployers read access to the executions log group.
* Upgraded `nullstone-io/ns` provider to `~> 0.13.0`.

# 0.2.0 (Jun 25, 2026)
* Upgraded `ns` provider to `0.11.1`.
* Switched to `aws_tags` for proper resource attribution.

# 0.1.3 (Feb 10, 2026)
* Fixed syntax of deployers policy.

# 0.1.2 (Feb 10, 2026)
* Added deployers IAM policy.

# 0.1.1 (Feb 21, 2024)
* Added permission for deployers to `ListTaskDefinitions`.

# 0.1.0 (Jul 25, 2023)
* Initial release.
