output "storage_accounts" {
  description = "Storage account details."

  value = {
    for key, sa in azurerm_storage_account.stg_block_01 : key => {
      id   = sa.id
      name = sa.name
    }
  }
}