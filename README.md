# KSUITextField
KSUITextField is a subclass of UITextField, that i use to make uitextfield in my recent project

## Getting Started
Subclass your UITextField to KSUITextField in 

Sample of use :

```
tftest.tfKey = "email" //to set key
tftest.textFieldType = .email //type of textfield
tftest.maxLength = 25 //max length of textfield
tftest.isEndOfForm = true //to determine keyboard return type, default = false
tftest.isOptional = true //to determine strict validation, default = false
```
## Notes     
TextField Type determine the input type and standart validation
Extension for validation with regex included.
