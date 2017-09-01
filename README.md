# KSUITextField
KSUITextField is a subclass of UITextField, that i use to make uitextfield in my recent project.
This UITextfield sub class also using Brian Voong UIView Extension helper which make it easier to do autolayout programatically.

To do more customization please edit the method in DidBegin & DidEnd :)

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

## State Fail/Success

Some example result : 

![ex success](https://github.com/kseta233/KSUITextField/blob/master/success.png)
![ex error](https://github.com/kseta233/KSUITextField/blob/master/err.png)

## Notes     
TextField Type determine the input type and standart validation
Extension for validation with regex included.
