locals {
  groups = {
    "foo" = {
      members = ["member1", "member2"]
    }
    "bar" = {
      members = ["member1"]
    }
  }

  members = {
    member1 = "Zak"
    member2 = "Zeke"
    member3 = "Zane"
  }

  group_members = [for gk, gv in local.groups : {
     for mk, mv in local.members : gk => mv... if (contains(gv.members, mk))
    }
  ]

  # for each member and group, get a list of map with member name mapped to group name where the member is in the group - group groups by member name
  member_groups = [for mk, mv in local.members : {
      for gk, gv in local.groups : mv => gk... if (contains(gv.members, mk))
  }]
}

output "group_members" {
  value = merge(local.group_members...)
}

output "member_groups" {
  value = merge(local.member_groups...)
}
