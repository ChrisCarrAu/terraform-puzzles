# Container-Transforms

Examples of transformations on list and map combinations

## GROUP TRANSFORMATIONS
Given a group name, return a list of members of the group

Given a member, return a list of groups they are a member of

### Inputs
- A map of groups. **key** is group-name and the **value** is a list of group-member-id.
- A separate map of members. **key** is member-id and **value** is member name.
### Desired outcome
- Produce a map of group-name to list-of-member-names
- Product a map of member-name to list-of-owner-groups

Given the input values

```
  # Map of group name to list of members
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
