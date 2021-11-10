# Terraform-related Smart Selection rules

Want a cmd-clickable link from any Terraform resource, data source, or provider to its documentation?

Add these manually in iTerm2 -> Preferences -> Profiles -> Advanced -> Smart Selection.

| Description          | Regular Expression            | Action      | Parameter                                               |
|----------------------|-------------------------------|-------------|---------------------------------------------------------|
| Terraform resource   | `resource "([^_"]+)_([^"]+)"` | Open URL... | `https://www.terraform.io/docs/providers/\1/r/\2.html`  |
| Terraform datasource | `data "([^_"]+)_([^"]+)"`     | Open URL... | `https://www.terraform.io/docs/providers/\1/d/\2.html`  |
| Terraform provider   | `provider "([^"]+)"`          | Open URL... | `https://www.terraform.io/docs/providers/\1/index.html` |
