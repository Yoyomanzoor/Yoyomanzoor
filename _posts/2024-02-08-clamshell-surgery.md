---
layout: post
title: clamshell surgery
date: 2024-02-08 18:07:01
description: Clinical pearls I've excised from my surgery rotation
tags: school
categories: [medicine, notes]
disqus_comments: true
# featured: true
# authors:
#   - name: Sumeed Manzoor
#     url: "https://github.com/yoyomanzoor"
#     affiliations:
#       name: University of Michigan Medical School
mermaid:
  - enabled: true
  - zoomable: true
toc:
  - name: neuro
  - name: CV
  - name: pulm
  - name: GI
  - name: GU
  - name: heme
  - name: endo
  - name: ID
  - name: dispo
---

This is a collection of clinical pearls I've excised from my surgery rotation. It is organized into a systems-based A&P.

## assessment and plan

### neuro

##### epidural (Ropivacaine) and PCA

In general, it is always worth considering whether a patient needs an epidural for pain control after surgery. As Val said, it either works well, or it doesn't work at all and the patient is unnecessarily hypotensive, and you should consider using just PCA instead of epidural to begin with.

If the patient is on epidural, you want to closely monitor blood pressures to make sure they don't go hypotensive. Hypotension due to an epi is either because the epi is too deep or it's working too well. If the patient is going hypotensive, consider a split. A split is where half of pain control is through epi and the other half is through PCA. If they are still hypotensive, you'll need to pause the epi and switch to full PCA

PCA is an IV pain med and will need to be switched to something PO before discharge (usually oxy)

##### NSAIDs

Don't give NSAIDs after a total gastrectomy!

### CV

### pulm

### GI

##### getting off NG tube

Getting off the nasogastric tube is a process of trial and error. It is a balance between encouraging more PO intake and emesis.

```mermaid
flowchart TD;
    A("NG LGWS")-->B(">300mL/shift");
    A-->C("<300mL/shift");
    B--keep in-->A;
    C-->D("4 hr DD trial/gravity");
    D-->E(">300mL or N/V");
    E--failure-->A;
    D-->F("<300mL");
    F-->G("LWS for 30 minutes");
    G-->H(">300mL residual volume");
    H-->A;
    G-->I("<300mL residual volume");
    I-->J("off NGT");
```

### GU

### heme

Almost all cancer patients get 30 days of lovenox.

##### when to get pRBCs

The magic number for when to order blood transfusion is HgB < 7 (or HgB < 8 if relevant cardiac hx).

### endo

You do not need tight glucose control. It is more harmful than helpful to tightly control glucose < 180, so leave it unless there is clinical indication or it is grossly high.

### ID

### dispo



