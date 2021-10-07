locals {
  // gung-ga-jung
    mystring = "A comes before B"
    mynumber = 3.14
    mybool   = true

    mylist = ["A", "B", "C", "D", "A", "B"]
    mymap  = {A : "a", B : "b", C: "c"}

    myobject = { name="Arthur Dent", age=42 }
    mytuple = ["Arthur Dent", 42, "Drinks tea"]
    
    myset = toset(local.mylist)

    subnet1 = {
      name = "A"
      address_prefixes = ["10.0.0.1/24"]
    }
    subnet2 = {
      name = "B"
      address_prefixes = ["10.0.1.1/24"]
    }
    subnet3 = {
      name = "A"
      address_prefixes = ["10.0.2.1/24"]
    }
    subnets = [local.subnet1, local.subnet2, local.subnet3]

    pickone = flatten([for subnet in local.subnets : subnet.address_prefixes if subnet.name == "A"])

    listofobj = [
      {
        given = "Bill"
        surname = "Todd"
      },
      {
        given = "Joe"
        surname = "Smith"
      }
    ]

    mapofobj = {
      billtodd = {
        given = "Bill"
        surname = "Todd"
      },
      joesmith = {
        given = "Joe"
        surname = "Smith"
      }
    }
}

output "mystring" {
  value = local.mystring
}

output "mynumber" {
  value = local.mynumber
}

output "mybool" {
  value = local.mybool  
}

output "mylist" {
  value = local.mylist
}

output "mymap" {
  value = local.mymap
}

output "myobject" {
  value = local.myobject
}

output "mytuple" {
  value = local.mytuple
}

output "myset" {
  value = local.myset
}

output "subnets" {
  value = local.subnets
}

output "pickone" {
  value = local.pickone
}

output "listofobj" {
  value = local.listofobj
}

output "mapofobj" {
  value = local.mapofobj
}

output "mapofobj_keys" {
  value = keys(local.mapofobj)
}

output "billtodds_name" {
  value = local.mapofobj["billtodd"].given
}
