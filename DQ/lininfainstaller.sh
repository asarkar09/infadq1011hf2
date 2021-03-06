{
  "$schema": "https://schema.management.azure.com/schemas/0.1.2-preview/CreateUIDefinition.MultiVm.json#",
  "handler": "Microsoft.Compute.MultiVm",
  "version": "0.1.2-preview",
  "parameters": {
    "basics": [
    ],
    "steps": [
      {
        "label": "Informatica Domain Settings",
        "name": "infaDomainConfiguration",
        "subLabel": {
          "preValidation": "Configure domain settings",
          "postValidation": "Done"
        },
        "bladeTitle": "Informatica Domain Settings",
        "elements": [
          {
            "name": "domainConfig",
            "type": "Microsoft.Common.Section",
            "label": "Domain configuration",
            "elements": [

              {
                "name": "infaVersion",
                "type": "Microsoft.Common.DropDown",
                "label": "Informatica Data Quality version",
                "defaultValue": "10.1.1",
                "toolTip": "Informatica Data Quality product version",
                "constraints": {
                  "allowedValues": [
                    {
                      "label": "10.1.1",
                      "value": "1011"
                    }
                  ]
                },
                "visible": true
              },
              {
                "name": "infaDomainName",
                "type": "Microsoft.Common.TextBox",
                "label": "Informatica domain name",
                "defaultValue": "Azure_Domain",
                "toolTip": "Specify a name for the Domain",
                "constraints": {
                  "required": true,
                  "regex": "^[a-z0-9A-Z_]{3,30}$",
                  "validationMessage": "Only alphanumeric characters and underscore are allowed. The value must be 3-30"
                }
              },
              {
                "name": "infaDomainUser",
                "type": "Microsoft.Common.TextBox",
                "label": "Informatica domain administrator name",
                "defaultValue": "Administrator",
                "toolTip": "Domain administrator user name",
                "constraints": {
                  "required": true,
                  "regex": "^[a-z0-9A-Z_]{3,30}$",
                  "validationMessage": "Only alphanumeric characters and underscore are allowed. The value must be 3-30"
                }
              },
              {
                "name": "infaDomainPassword",
                "type": "Microsoft.Common.PasswordBox",
                "label": {
                  "password": "Informatica domain password",
                  "confirmPassword": "Confirm Informatica domain password"
                },
                "constraints": {
                  "required": true,
                  "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                  "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                },
                "options": {
                  "hideConfirmation": false
                }

              },
              {
                "name": "infaDomainEncryptionKeyword",
                "type": "Microsoft.Common.PasswordBox",
                "toolTip": "Keyphrase for generating encryption key for domain",
                "label": {
                  "password": "Keyphrase for encryption key",
                  "confirmPassword": "Confirm keyphrase for encryption key"
                },
                "constraints": {
                  "required": true,
                  "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,20}$",
                  "validationMessage": "Keyphrase should contain 8-20 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                },
                "options": {
                  "hideConfirmation": true
                }
              },
              {
                "name": "infaDomainLicense",
                "type": "Microsoft.Common.FileUpload",
                "label": "Informatica license file",
                "toolTip": "",
                "constraints": {
                  "required": false,
                  "accept": ".key"
                },
                "options": {
                  "multiple": false,
                  "uploadMode": "url",
                  "openMode": "text",
                  "encoding": "UTF-8"
                },
                "visible": true
              }
            ]
          },
          {
            "name": "domainServiceConfig",
            "type": "Microsoft.Common.Section",
            "label": "Service configuration",
            "elements": [
              {
                "name": "DQServiceCreateOrSkip",
                "type": "Microsoft.Common.OptionsGroup",
                "label": "DQ services",
                "defaultValue": "Create",
                "toolTip": "Choose option Create if DQ Services (MRS,DIS,CMS,AS) has to be created or Skip to if you want to create it later",
                "constraints": {
                  "allowedValues": [
                    {
                      "label": "Create",
                      "value": "create"
                    },
                    {
                      "label": "Skip",
                      "value": "skip"
                    }
                  ]
                }
              }
            ]
          }
        ]
        
     },
              {
                "name": "nodeVMConfiguration",
                "label": "Node Settings",
                "subLabel": {
                  "preValidation": "Configure machine settings for the node",
                  "postValidation": "Done"
                },
                "bladeTitle": "Node Settings",
                "elements": [
                  {
                    "name": "nodeVMOS",
                    "type": "Microsoft.Common.DropDown",
                    "label": "Select the OS for the VM",
                    "defaultValue": "Windows Server 2012 R2 Datacenter",
                    "toolTip": "OS platform of the VM.",
                    "constraints": {
                      "allowedValues": [
                        {
                          "label": "Windows Server 2012 R2 Datacenter",
                          "value": "windows"
                        },
                        {
                          "label": "Red Hat Enterprise Linux 7.3",
                          "value": "linux"
                        }
                      ]
                    }
                  },
                  {
                    "name": "nodeVMPrefix",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Machine prefix",
                    "defaultValue": "VM",
                    "toolTip": "Prefix for machine name",
                    "constraints": {
                      "required": true,
                      "regex": "^([a-zA-Z][a-z0-9A-Z\\-]{1,29})$",
                      "validationMessage": "Host prefix should begin with alphabets. Only alphanumeric characters, and hyphen are allowed. The value must be 2-29 characters long"
                    }
                  },
                  {
                    "name": "nodeVMAdminUsernameWin",
                    "type": "Microsoft.Compute.UserNameTextBox",
                    "label": "VM Username",
                    "toolTip": "Admin username for the virtual machines.",
                    "osPlatform": "Windows",
                    "constraints": {
                      "required": true
                    },
                    "visible": "[equals(steps('nodeVMConfiguration').nodeVMOS, 'windows')]"
                  },
                  {
                    "name": "nodeVMAdminUsernameLin",
                    "type": "Microsoft.Compute.UserNameTextBox",
                    "label": "VM Username",
                    "toolTip": "Admin username for the virtual machines.",
                    "osPlatform": "Linux",
                    "constraints": {
                      "required": true
                    },
                    "visible": "[equals(steps('nodeVMConfiguration').nodeVMOS, 'linux')]"
                  },
                  {
                    "name": "nodeVMAdminPasswordWin",
                    "type": "Microsoft.Compute.CredentialsCombo",
                    "label": {
                      "password": "Password",
                      "confirmPassword": "Confirm password"
                    },
                    "toolTip": {
                      "password": ""
                    },
                    "constraints": {
                      "required": true
                    },
                    "options": {
                      "hideConfirmation": false
                    },
                    "osPlatform": "Windows",
                    "visible": "[equals(steps('nodeVMConfiguration').nodeVMOS, 'windows')]"
                  },
                  {
                    "name": "nodeVMAdminPasswordLin",
                    "type": "Microsoft.Compute.CredentialsCombo",
                    "label": {
                      "authenticationType": "Authentication type",
                      "password": "Password",
                      "confirmPassword": "Confirm password",
                      "sshPublicKey": "SSH public key"
                    },
                    "toolTip": {
                      "authenticationType": "",
                      "password": "",
                      "sshPublicKey": ""
                    },
                    "constraints": {
                      "required": true
                    },
                    "options": {
                      "hideConfirmation": false,
                      "hidePassword": false
                    },
                    "osPlatform": "Linux",
                    "visible": "[equals(steps('nodeVMConfiguration').nodeVMOS, 'linux')]"
                  },
                  {
                    "name": "nodeVMSizeWin",
                    "type": "Microsoft.Compute.SizeSelector",
                    "label": "Machine size",
                    "toolTip": "The size of the machine",
                    "recommendedSizes": [
                      "Standard_DS11",
                      "Standard_DS11_v2",
                      "Standard_DS2",
                      "Standard_DS2_v2"
                    ],
                    "osPlatform": "Windows",
                    "imageReference": {
                      "publisher": "informatica",
                      "offer": "dataquality_10_1_1_windows_byol",
                      "sku": "byol_windows_dataquality_10_1_1"
                    },
                    "count": 1,
                    "visible": "[equals(steps('nodeVMConfiguration').nodeVMOS, 'windows')]"
                  },
                  {
                    "name": "nodeVMSizeLin",
                    "type": "Microsoft.Compute.SizeSelector",
                    "label": "Machine size",
                    "toolTip": "The size of the machine",
                    "recommendedSizes": [
                      "Standard_DS11",
                      "Standard_DS11_v2",
                      "Standard_DS2",
                      "Standard_DS2_v2"
                    ],
                    "osPlatform": "Linux",
                    "imageReference": {
                      "publisher": "informatica",
                      "offer": "data_quality_10_1_1_rhel_7_3_byol",
                      "sku": "byol_rhel_7_3_data_quality_10_1_1"
                    },
                    "count": 1,
                    "visible": "[equals(steps('nodeVMConfiguration').nodeVMOS, 'linux')]"
                  }
                ]
              },
          {
            "name": "databaseConfiguration",
            "label": "Database Settings",
            "subLabel": {
              "preValidation": "Configure database settings",
              "postValidation": "Done"
            },
            "bladeTitle": "Database Settings",
            "elements": [
              {
                "name": "databaseNewOrExisting",
                "type": "Microsoft.Common.OptionsGroup",
                "label": "Database",
                "defaultValue": "New",
                "toolTip": "Choose option New if database has to be created or Existing to use existing database on Azure",
                "constraints": {
                  "allowedValues": [
                    {
                      "label": "New",
                      "value": "new"
                    },
                    {
                      "label": "Existing",
                      "value": "existing"
                    }
                  ]
                }
              },
              {
                "name": "databaseConfig",
                "type": "Microsoft.Common.Section",
                "label": "Database configuration",
                "elements": [
                  {
                    "name": "databaseType",
                    "type": "Microsoft.Common.DropDown",
                    "label": "Database type",
                    "defaultValue": "SQL Server 2014",
                    "constraints": {
                      "allowedValues": [
                        {
                          "label": "SQL Server 2014",
                          "value": "sqlserver2014"
                        },
                        {
                          "label": "SQL Server 2016",
                          "value": "sqlserver2016"
                        }
                      ]
                    }
                  },
                  {
                    "name": "databaseHostName",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Database machine name",
                    "defaultValue": "DVM",
                    "constraints": {
                      "required": true,
                      "regex": "^([a-zA-Z][a-z0-9A-Z\\-]{2,30})$",
                      "validationMessage": "Only alphanumeric characters, and hyphen are allowed. The value must be 3-30 characters long"
                    },
                    "visible": "[not(equals(steps('databaseConfiguration').databaseConfig.databaseType, 'azuresqlserver'))]"
                  },

                  {
                    "name": "dbVMAdminUsername",
                    "type": "Microsoft.Compute.UserNameTextBox",
                    "label": "Username",
                    "toolTip": "Admin username for the machines",
                    "osPlatform": "Windows",
                    "constraints": {
                      "required": true
                    },
                    "visible": "[not(equals(steps('databaseConfiguration').databaseConfig.databaseType, 'azuresqlserver'))]"
                  },
                  {
                    "name": "dbVMAdminPassword",
                    "type": "Microsoft.Compute.CredentialsCombo",
                    "label": {
                      "password": "Password",
                      "confirmPassword": "Confirm password"
                    },
                    "toolTip": {
                      "password": "Admin password for the machines"
                    },
                    "osPlatform": "Windows",
                    "constraints": {
                      "required": true
                    },
                    "visible": "[not(equals(steps('databaseConfiguration').databaseConfig.databaseType, 'azuresqlserver'))]"
                  },

                  {
                    "name": "databaseName",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Database name",
                    "defaultValue": "infadb",
                    "toolTip": "Name for the database",
                    "constraints": {
                      "required": true,
                      "regex": "^([a-zA-Z][a-z0-9A-Z]{2,30})$",
                      "validationMessage": "Only alphanumeric characters are allowed. The value must be 3-30 characters long"
                    },
                    "visible": "[not(equals(steps('databaseConfiguration').databaseConfig.databaseType, 'azuresqlserver'))]"
                  },


                  {
                    "name": "databaseVMSize",
                    "type": "Microsoft.Compute.SizeSelector",
                    "label": "Database  machine size",
                    "toolTip": "The size of machine for database",
                    "recommendedSizes": [
                      "Standard_DS3",
                      "Standard_DS3_v2",
                      "Standard_DS4",
                      "Standard_DS4_v2"
                    ],
                    "osPlatform": "Windows",
                    "imageReference": {
                      "publisher": "MicrosoftSQLServer",
                      "offer": "SQL2014SP2-WS2012R2",
                      "sku": "Enterprise"
                    },
                    "count": 1,
                    "visible": "[not(equals(steps('databaseConfiguration').databaseConfig.databaseType, 'azuresqlserver'))]"
                  }
                ],
                "visible": "[equals(steps('databaseConfiguration').databaseNewOrExisting, 'new')]"
              },
              {
                "name": "domainDatabaseUser",
                "type": "Microsoft.Common.Section",
                "label": "Informatica Domain Database User",
                "elements": [
                  {
                    "name": "infaDomainDBUser",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Informatica Domain Database username",
                    "defaultValue": "",
                    "toolTip": "Database user to be created for communication between Domain and Database",
                    "constraints": {
                      "required": true,
                      "regex": "(?!^(p|P)(u|U)(b|B)(l|L)(i|I)(c|C)$)(?!^(d|D)(b|B)(o|O)$)(?!^(s|S)(y|Y)(s|S)$)(?!^(g|G)(u|U)(e|E)(s|S)(t|T)$)(^[a-zA-Z][a-zA-Z0-9_-]{2,127}$)",
                      "validationMessage": "Username must begin with an alphabet, only alphanumeric characters, hyphen and underscore are allowed, and the value must be 3-128 characters in length. Usernames sa, public, dbo, sys, and guest are not allowed"
                    }
                  },
                  {
                    "name": "infaDomainDBPassword",
                    "type": "Microsoft.Common.PasswordBox",
                    "label": {
                      "password": "Informatica Domain Database password",
                      "confirmPassword": "Confirm Informatica Domain Database password"
                    },
                    "constraints": {
                      "required": true,
                      "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                      "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                    },
                    "options": {
                      "hideConfirmation": false
                    }
                  }
                ],
                "visible": "[equals(steps('databaseConfiguration').databaseNewOrExisting, 'new')]"
                //  }
                // ]
              },
              {
                /*    "name": "dqConfig",
                    "label": "Informatica Data Quality Services",
                    "subLabel": {
                      "preValidation": "Configure Informatica Data Quality Services",
                      "postValidation": "Done"
                    },
                    "bladeTitle": "Informatica Data Quality Services", */
                "name": "dqConfig",
                "type": "Microsoft.Common.Section",
                "label": "Informatica Data Quality Services",
           /*     "elements": [
                  {
                    "name": "mrsdbconfig",
                    "type": "Microsoft.Common.Section",
                    "label": "Model Repository Configuration", */
                    "elements": [
                      {
                        "name": "mrsDBuser",
                        "type": "Microsoft.Common.TextBox",
                        "label": "Database Username",
                        "defaultValue": "",
                        "toolTip": "Database user to be created for Model Repository Service",
                        "constraints": {
                          "required": true,
                          "regex": "(?!^(p|P)(u|U)(b|B)(l|L)(i|I)(c|C)$)(?!^(d|D)(b|B)(o|O)$)(?!^(s|S)(y|Y)(s|S)$)(?!^(g|G)(u|U)(e|E)(s|S)(t|T)$)(^[a-zA-Z][a-zA-Z0-9_-]{2,127}$)",
                          "validationMessage": "Username must begin with an alphabet, only alphanumeric characters, hyphen and underscore are allowed, and the value must be 3-128 characters in length. Usernames sa, public, dbo, sys, and guest are not allowed"
                        }
                      },
                      {
                        "name": "mrsDBpassword",
                        "type": "Microsoft.Common.PasswordBox",
                        "label": {
                          "password": "Database Password",
                          "confirmPassword": "Confirm Database Password"
                        },
                        "constraints": {
                          "required": true,
                          "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                          "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                        },
                        "options": {
                          "hideConfirmation": false
                        }
                      },
                 //   ]
               //   },
                  {
                    
                        "name": "refDataDBuser",
                        "type": "Microsoft.Common.TextBox",
                        "label": "Database Username",
                        "defaultValue": "",
                        "toolTip": "Database user to be created for Reference Data",
                        "constraints": {
                          "required": true,
                          "regex": "(?!^(p|P)(u|U)(b|B)(l|L)(i|I)(c|C)$)(?!^(d|D)(b|B)(o|O)$)(?!^(s|S)(y|Y)(s|S)$)(?!^(g|G)(u|U)(e|E)(s|S)(t|T)$)(^[a-zA-Z][a-zA-Z0-9_-]{2,127}$)",
                          "validationMessage": "Username must begin with an alphabet, only alphanumeric characters, hyphen and underscore are allowed, and the value must be 3-128 characters in length. Usernames sa, public, dbo, sys, and guest are not allowed"
                        }
                      },
                      {
                        "name": "refDataDBpassword",
                        "type": "Microsoft.Common.PasswordBox",
                        "label": {
                          "password": "Database Password",
                          "confirmPassword": "Confirm Database Password"
                        },
                        "constraints": {
                          "required": true,
                          "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                          "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                        },
                        "options": {
                          "hideConfirmation": false
                        }
                      },
                  
                  {
                   
                        "name": "profileDBuser",
                        "type": "Microsoft.Common.TextBox",
                        "label": "Database Username",
                        "defaultValue": "",
                        "toolTip": "Database user to be created for Profiling Warehouse",
                        "constraints": {
                          "required": true,
                          "regex": "(?!^(p|P)(u|U)(b|B)(l|L)(i|I)(c|C)$)(?!^(d|D)(b|B)(o|O)$)(?!^(s|S)(y|Y)(s|S)$)(?!^(g|G)(u|U)(e|E)(s|S)(t|T)$)(^[a-zA-Z][a-zA-Z0-9_-]{2,127}$)",
                          "validationMessage": "Username must begin with an alphabet, only alphanumeric characters, hyphen and underscore are allowed, and the value must be 3-128 characters in length. Usernames sa, public, dbo, sys, and guest are not allowed"
                        }
                      },
                      {
                        "name": "profileDBpassword",
                        "type": "Microsoft.Common.PasswordBox",
                        "label": {
                          "password": "Database Password",
                          "confirmPassword": "Confirm Database Password"
                        },
                        "constraints": {
                          "required": true,
                          "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                          "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                        },
                        "options": {
                          "hideConfirmation": false
                        }
                      }
                  
                ],
                "visible": "[and(equals(steps('databaseConfiguration').databaseNewOrExisting, 'new'), equals(steps('infaDomainConfiguration').domainServiceConfig.DQServiceCreateOrSkip, 'create'))]"
              },

              {
                "name": "databaseExistingType",
                "type": "Microsoft.Common.DropDown",
                "label": "Database type",
                "defaultValue": "SQL Server",
                "constraints": {
                  "allowedValues": [
                    {
                      "label": "SQL Server",
                      "value": "sqlserver"
                    },
                    {
                      "label": "Oracle",
                      "value": "oracle"
                    },
                    {
                      "label": "DB2",
                      "value": "db2"
                    }
                  ]
                },
                "visible": "[equals(steps('databaseConfiguration').databaseNewOrExisting, 'existing')]"
              },

              {
                "name": "databaseExistingConfig",
                "type": "Microsoft.Common.Section",
                "label": "Database configuration",
                "elements": [
                  {
                    "name": "databaseExistingHostName",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Database machine name",
                    "constraints": {
                      "required": true,
                      "regex": "^(?!.*[\"$]).{1,255}$",
                      "validationMessage": "Double quote(\") and dollar($) is not allowed"
                    }
                  },
                  {
                    "name": "databaseExistingPort",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Database port",
                    "constraints": {
                      "required": true,
                      "regex": "^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$",
                      "validationMessage": "Port number should be between 0 to 65535"
                    }
                  },
                  {
                    "name": "databaseExistingName",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Database name",
                    "constraints": {
                      "required": true,
                      "regex": "^(?!.*[\"$]).{1,255}$",
                      "validationMessage": "Double quote(\") and dollar($) is not allowed"
                    }
                  },
                  {
                    "name": "databaseExistingTablespace",
                    "type": "Microsoft.Common.TextBox",
                    "label": "DB2 database tablespace name",
                    "constraints": {
                      "required": false,
                      "regex": "^(?!.*[\"$]).{1,255}$",
                      "validationMessage": "Double quote(\") and dollar($) is not allowed"
                    },
                    "visible": "[equals(steps('databaseConfiguration').databaseExistingType, 'db2')]"
                  }
                ],
                "visible": "[equals(steps('databaseConfiguration').databaseNewOrExisting, 'existing')]"
              },

              {
                "name": "domainExistingDatabaseUser",
                "type": "Microsoft.Common.Section",
                "label": "Domain database user",
                "elements": [
                  {
                    "name": "infaExistingDomainDBUser",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Informatica domain DB user",
                    "defaultValue": "",
                    "toolTip": "Database user needed for communication between Domain and Database",
                    "constraints": {
                      "required": true,
                      "regex": "^(?!.*[\"$]).{1,255}$",
                      "validationMessage": "Double quote(\") and dollar($) is not allowed"
                    }
                  },
                  {
                    "name": "infaExistingDomainDBPassword",
                    "type": "Microsoft.Common.PasswordBox",
                    "label": {
                      "password": "Informatica domain DB password",
                      "confirmPassword": "Confirm Informatica domain DB password"
                    },
                    "constraints": {
                      "required": true,
                      "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                      "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                    },
                    "options": {
                      "hideConfirmation": true
                    }
                  }
                ],
                "visible": "[equals(steps('databaseConfiguration').databaseNewOrExisting, 'existing')]"
              },

              {
                "name": "serviceExistingDatabaseUser",
                "type": "Microsoft.Common.Section",
                "label": "Service database user",
                "elements": [
                  {
                    "name": "infaExistingMRSDBUser",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Informatica Repository DB user",
                    "defaultValue": "",
                    "toolTip": "Database user needed to create Model Repository Service",
                    "constraints": {
                      "required": true,
                      "regex": "^(?!.*[\"$]).{1,255}$",
                      "validationMessage": "Double quote(\") and dollar($) is not allowed"
                    }
                  },
                  {
                    "name": "infaExistingMRSDBPassword",
                    "type": "Microsoft.Common.PasswordBox",
                    "label": {
                      "password": "Informatica Repository DB password",
                      "confirmPassword": "Confirm Informatica Repository DB password"
                    },
                    "constraints": {
                      "required": true,
                      "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                      "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                    },
                    "options": {
                      "hideConfirmation": true
                    }
                  },
                  {
                    "name": "infaExistingCMSDBUser",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Informatica Repository DB user",
                    "defaultValue": "",
                    "toolTip": "Database user needed to create Reference Data",
                    "constraints": {
                      "required": true,
                      "regex": "^(?!.*[\"$]).{1,255}$",
                      "validationMessage": "Double quote(\") and dollar($) is not allowed"
                    }
                  },
                  {
                    "name": "infaExistingCMSDBPassword",
                    "type": "Microsoft.Common.PasswordBox",
                    "label": {
                      "password": "Reference Data DB password",
                      "confirmPassword": "Confirm Reference Data DB password"
                    },
                    "constraints": {
                      "required": true,
                      "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                      "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                    },
                    "options": {
                      "hideConfirmation": true
                    }
                  },
                  {
                    "name": "infaExistingProfileDBUser",
                    "type": "Microsoft.Common.TextBox",
                    "label": "Informatica Repository DB user",
                    "defaultValue": "",
                    "toolTip": "Database user needed to create Profiling Warehouse",
                    "constraints": {
                      "required": true,
                      "regex": "^(?!.*[\"$]).{1,255}$",
                      "validationMessage": "Double quote(\") and dollar($) is not allowed"
                    }
                  },
                  {
                    "name": "infaExistingProfileDBPassword",
                    "type": "Microsoft.Common.PasswordBox",
                    "label": {
                      "password": "Informatica Profiling Warehouse DB password",
                      "confirmPassword": "Confirm Informatica Profiling Warehouse DB password"
                    },
                    "constraints": {
                      "required": true,
                      "regex": "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^\\s\\w])(?!.*[\"$]).{8,123}$",
                      "validationMessage": "Password must be at least 8 characters in length. Should contain at least one special character, number, upper-case and lower-case character. Double quote(\") and dollar($) is not allowed"
                    },
                    "options": {
                      "hideConfirmation": true
                    }
                  }
                ],
                "visible": "[and(equals(steps('databaseConfiguration').databaseNewOrExisting, 'existing'), equals(steps('infaDomainConfiguration').domainServiceConfig.pcServiceCreateOrSkip, 'create'))]"
              }
            ]
          },

                  {
                    "name": "infraConfiguration",
                    "label": "Infrastructure Settings",
                    "subLabel": {
                      "preValidation": "Configure Storage and VNET settings",
                      "postValidation": "Done"
                    },
                    "bladeTitle": "Infrastructure Settings",
                    "elements": [
                      {
                        "name": "storageAccount",
                        "type": "Microsoft.Storage.StorageAccountSelector",
                        "label": "Storage account",
                        "toolTip": "Storage account used for the machines",
                        "defaultValue": {
                          "type": "Standard_LRS"
                        }
                      },
                      {
                        "name": "infavnet",
                        "type": "Microsoft.Network.VirtualNetworkCombo",
                        "label": {
                          "virtualNetwork": "Virtual network",
                          "subnets": "Subnets"
                        },
                        "toolTip": {
                          "virtualNetwork": "Virtual network all resource required to be part of",
                          "subnets": "Subnet all resource required to be part of"
                        },
                        "defaultValue": {
                          "name": "InfaVNET",
                          "addressPrefixSize": "/16"
                        },
                        "constraints": {
                          "minAddressPrefixSize": "/30"
                        },
                        "subnets": {
                          "subnet1": {
                            "label": "Subnet",
                            "defaultValue": {
                              "name": "InfaSubnet",
                              "addressPrefixSize": "/24"
                            },
                            "constraints": {
                              "minAddressPrefixSize": "/30",
                              "minAddressCount": "[add(1, 1)]",
                              "requireContiguousAddresses": true
                            }
                          }
                        }
                      }
                    ]
                  }
                ],

        "outputs": {
          "location": "[location()]",
          "nodeVMNamePrefix": "[steps('nodeVMConfiguration').nodeVMPrefix]",
          "nodeVMAuthType": "[coalesce(steps('nodeVMConfiguration').nodeVMAdminPasswordWin.authenticationType, steps('nodeVMConfiguration').nodeVMAdminPasswordLin.authenticationType)]",
          "nodeVMAdminUsername": "[coalesce(steps('nodeVMConfiguration').nodeVMAdminUsernameWin, steps('nodeVMConfiguration').nodeVMAdminUsernameLin)]",
          "nodeVMAdminPassword": "[coalesce(steps('nodeVMConfiguration').nodeVMAdminPasswordWin.password, steps('nodeVMConfiguration').nodeVMAdminPasswordLin.password)]",
          "nodeVMAdminSshPublicKey": "[steps('nodeVMConfiguration').nodeVMAdminPasswordLin.sshPublicKey]",
          "nodeVMSize": "[coalesce(steps('nodeVMConfiguration').nodeVMSizeWin, steps('nodeVMConfiguration').nodeVMSizeLin)]",
          "nodeVMOS": "[steps('nodeVMConfiguration').nodeVMOS]",
          "infaVersion": "[steps('infaDomainConfiguration').domainConfig.infaVersion]",
          "infaDomainName": "[steps('infaDomainConfiguration').domainConfig.infaDomainName]",
          "infaDomainUser": "[steps('infaDomainConfiguration').domainConfig.infaDomainUser]",
          "infaDomainPassword": "[steps('infaDomainConfiguration').domainConfig.infaDomainPassword]",
          "infaDomainLicense": "[steps('infaDomainConfiguration').domainConfig.infaDomainLicense]",
          "infaKeyword": "[steps('infaDomainConfiguration').domainConfig.infaDomainEncryptionKeyword]",
          "infaDQSkipOrCreate": "[steps('infaDomainConfiguration').domainServiceConfig.DQServiceCreateOrSkip]",
          "dbNewOrExisting": "[steps('databaseConfiguration').databaseNewOrExisting]",
          "dbVMName": "[coalesce(steps('databaseConfiguration').databaseConfig.databaseHostName, steps('databaseConfiguration').databaseExistingConfig.databaseExistingHostName)]",
          "dbVMSize": "[steps('databaseConfiguration').databaseConfig.databaseVMSize]",
          "dbType": "[coalesce(steps('databaseConfiguration').databaseConfig.databaseType, steps('databaseConfiguration').databaseExistingType)]",
          "dbName": "[coalesce(steps('databaseConfiguration').databaseConfig.databaseName, steps('databaseConfiguration').databaseExistingConfig.databaseExistingName)]",
          "dbPort": "[steps('databaseConfiguration').databaseExistingConfig.databaseExistingPort]",
          "dbTablespace": "[steps('databaseConfiguration').databaseExistingConfig.databaseExistingTablespace]",
          "dbVMAdminUsername": "[steps('databaseConfiguration').databaseconfig.dbVMAdminUsername]",
          "dbVMAdminPassword": "[steps('databaseConfiguration').databaseconfig.dbVMAdminPassword.password]",
          "dbUser": "[coalesce(steps('databaseConfiguration').domainDatabaseUser.infaDomainDBUser, steps('databaseConfiguration').domainExistingDatabaseUser.infaExistingDomainDBUser)]",
          //   "dbPassword": "[steps('databaseConfiguration').databaseuser.infaDomainDBPassword]",
          "dbPassword": "[coalesce(steps('databaseConfiguration').domainDatabaseUser.infaDomainDBPassword, steps('databaseConfiguration').domainExistingDatabaseUser.infaExistingDomainDBPassword)]",
          //  "mrsdbuser": "[steps('dqConfig').mrsdbconfig.mrsDBuser]",
          "mrsdbuser": "[coalesce(steps('databaseConfiguration').dqConfig.mrsDBuser, steps('databaseConfiguration').serviceExistingDatabaseUser.infaExistingMRSDBUser)]",
          //  "mrsdbpwd": "[steps('dqConfig').mrsdbconfig.mrsDBpassword]",
          "mrsdbpwd": "[coalesce(steps('databaseConfiguration').dqConfig.mrsDBpassword, steps('databaseConfiguration').serviceExistingDatabaseUser.infaExistingMRSDBPassword)]",
          "refdatadbuser": "[coalesce(steps('databaseConfiguration').dqConfig.refDataDBuser, steps('databaseConfiguration').serviceExistingDatabaseUser.infaExistingCMSDBUser)]",
          "refdatadbpwd": "[coalesce(steps('databaseConfiguration').dqConfig.refDataDBpassword, steps('databaseConfiguration').serviceExistingDatabaseUser.infaExistingCMSDBPassword)]",
          "profiledbuser": "[coalesce(steps('databaseConfiguration').dqConfig.profileDBuser, steps('databaseConfiguration').serviceExistingDatabaseUser.infaExistingProfileDBUser)]",
          "profiledbpwd": "[coalesce(steps('databaseConfiguration').dqConfig.profileDBpassword, steps('databaseConfiguration').serviceExistingDatabaseUser.infaExistingProfileDBPassword)]",
          "storageName": "[steps('infraConfiguration').storageAccount.name]",
          "storageType": "[steps('infraConfiguration').storageAccount.type]",
          "storageExistingOrNew": "[steps('infraConfiguration').storageAccount.newOrExisting]",
          "existingStorageRG": "[steps('infraConfiguration').storageAccount.resourceGroup]",
          "vnetName": "[steps('infraConfiguration').infavnet.name]",
          "vnetAddressPrefix": "[steps('infraConfiguration').infavnet.addressPrefix]",
          "vnetExistingOrNew": "[steps('infraConfiguration').infavnet.newOrExisting]",
          "existingVnetRG": "[steps('infraConfiguration').infavnet.resourceGroup]",
          "subnetName": "[steps('infraConfiguration').infavnet.subnets.subnet1.name]",
          "subnetPrefix": "[steps('infraConfiguration').infavnet.subnets.subnet1.addressPrefix]"
        }
    }      
}
