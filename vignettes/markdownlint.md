---
title: "How to use TeamPSD Markdown Linter"
author: "TeamPSD"
date: "2020 May 21"
output: .md
---

This vignette describes the steps necessary to edit/add rules to  the `.markdownlint.yml` file in the root of the repository.

For a video, go to this link: https://youtu.be/mPaXA1DlIlk

Before beginning, let's **first start create a branch** to work off of within your repository, since you will need to initiate a pull request by the end of this guide. 

## 1) Built-in rules for Markdownlint
Let’s first look at and understand the rules that are pre-baked into Markdownlint here at David Anson's repository, who is the creator of Markdownlint:
https://github.com/DavidAnson/markdownlint/blob/master/doc/Rules.md

1) How to read the Rules.md

Let's take a look at the first rule, **MD001 - Header levels should only increment by one level at a time**.

We can see that there are sections broken down as **tags**, **aliases**, and a **description and code snippets** of examples related to the rule.

The tags and aliases are to help us find the rule we are looking for where we are at the home page of David Anson's Markdownlint repository: https://github.com/DavidAnson/markdownlint

The **description** and **code snippets** describe and show you the definitions of what the rule is attempting to scan for and address.

2) If we look at another rule, let's look at **MD003 - Heading style**.

In addition to the **tags**, **aliases**, **description**, **code snippets**, there is an additional section called **parameters**.

Within parameters, we see the main parameter being `style` and then choices regarding the parameter style such as:

`"consistent", "atx", "atx_closed", "setext", "setext_with_atx", "setext_with_atx_closed"; default "consistent"`

The **description** and **code snippets** also show you the definitions and how each of the parameters look like.

## 2) Convention for adding or editing rules

1) For rules without parameters:

Start with the **rule number** within **quotation marks** followed by a **colon** and then type `True` to indicate that you are activating the rule.

Using **MD001 - Header levels should only increment by one level at a time.** for example:

`"MD001": True`

2) For rules with parameters:

Start with the **rule number** within **quotation marks** followed by a **colon** and 
then **curly brackets** with the **parameter name** within **quotation marks** followed by a **colon**.

Lastly, type in the **parameter option** in **quotation marks** all within the **curly brackets**.

Using **MD003 - Heading style.** for example:

`"MD003": { "style": "atx_closed" }`

## 3) Testing the markdownlint yaml to see if the rules have been applied by using a pull request.

1) Create a markdown file that tests the rules you added. 
2) At least one rule should purposefully pass and one rule should purposefully fail with respect to the content in the markdown file.
3) Create a pull request and you should notice a CI/Build near the bottom of the pull request where you could make a comment.
4) Then CI Build will complete the linting when you see that the build has failed by showing a red X
5) Click on **details** on the right.
5) In the **search log**, type in your **markdown file name** to find it quickly within all the markdown files the linter is searching through.
6) Identify the rules the linter looked for and where it detected markdown mistakes that occured. 

If the build properly detected the rules that you purposefully wrote to fail and pass in your markdown file, then you have successfully added/edited the `.markdownlint.yml` with new/revised rules. 

You can then continue with your pull request to merge the `.markdownlint.yml` into the Master branch. 
