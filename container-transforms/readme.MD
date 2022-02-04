# Container-Transforms

Examples of transformations on list and map combinations

## GROUP BY

Given

```
  groups = {
    "group1" = {
      name    = "foo"
      members = ["member1", "member2"]
    }
    "group2" = {
      name    = "bar"
      members = ["member1"]
    }
  }

  members = {
    member1 = "Zak"
    member2 = "Zeke"
    member3 = "Zane"
  }
```
Produces output
```
  + group_members = {
      + bar = [
          + "Zak",
        ]
      + foo = [
          + "Zak",
          + "Zeke",
        ]
    }
  + member_groups = {
      + Zak  = [
          + "foo",
          + "bar",
        ]
      + Zeke = [
          + "foo",
        ]
    }
```