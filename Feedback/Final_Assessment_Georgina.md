
# Final CMEE Bootcamp Assessment: Georgina Chow

- You maintained a well-organized project structure, with directories for `code`, `data`, `results`, and `sandbox`.
  
- You had an .gitignore, good! You could have done with more exclusions specific to certain weeks (remember that you can include/exclude subdirectories/files/patterns). You may [find this useful](https://www.gitignore.io).

- You had a good overall Readme which gave a sufficient overview of the Repo as a whole, and gave general details of things like languages used. You also had weekly Readme files which went into more details relevant to each week. You could have included versions of languages and dependencies/packages used. Also check out [this resource](https://github.com/jehna/readme-best-practices).

## Week  1

- README provided a basic overview of tasks and folder organization.
- Results folder was empty as expected.
   - `.gitignore` was missing some patterns, resulting in unnecessary files being tracked.
- README lacked specific details about input and output for each script.
- Scripts demonstrated foundational shell scripting skills but lacked robustness in handling edge cases.
  - `variables.sh` produced errors due to improper handling of user input.
  - `ConcatenateTwoFiles.sh` and `tiff2png.sh` failed due to missing input validation.

## Week  2

- Added more descriptive README, including dependencies and usage instructions for Python scripts.
- Improved `.gitignore` to exclude unnecessary files.
   - README could include examples of expected output for key scripts.
- Results folder occasionally contained output files that should not be tracked.
- `align_seqs.py` lacked error handling for missing or malformed input files.
- Inconsistent adherence to PEP 8 guidelines.

## Week  3

- README provided detailed descriptions of R scripts, dependencies, and usage instructions.
- Dependencies for R were listed, including installation instructions.
   - README could include troubleshooting tips for common errors when running R scripts.
- Some scripts could benefit from additional inline comments to clarify logic.

## Week  4

- README covered all aspects of the Florida autocorrelation practical and LaTeX integration.
- The workflow was well-documented, including instructions for running scripts and generating the final PDF.
- `FloridaLaTeX.sh` required specific system configurations, which could have been better documented.
- `Florida.R` implemented statistical testing and visualizations effectively, including permutation tests; linear regression was unwarranted (lm assumptions not met by data).
- Good inline comments to explain the logic behind each step.
- The LaTeX report was well-structured, concise, and included all necessary figures and results.
  - Could have expanded the discussion to include broader implications of temperature trends.

- Your Groupwork practicals were all in order, and your group did well in collaborating on it based on the commit/merge/pull history. Check the groupwork feedback pushed to your group repo for more details.   
  - The Autocorrelation practical code was efficient, providing a correct answer to the question. The statistical and biological/ecological interpretations in the report could have been stronger; had a somewhat weak conclusion at the end.


---

## Git Practices

### General Observations:
- Commit frequency and message detail improved significantly across the weeks.
- `.gitignore` was introduced early and refined over time to exclude unnecessary files.
- Some early commits lacked detail (e.g., "update script"). Use descriptive messages like "Add error handling to Florida.R."
- Introducing feature branches for major updates could further enhance collaboration and workflow management.

---

## Overall Assessment

You did an excellent job overall! 

You demonstrated steady progress in programming, workflow organization, and documentation. I was impressed by your efforts to understand as many details of the programming languages and coding as possible.

Some of your scripts retained fatal errors which could nave been easily fixed - work on being more vigilant and persistent in chasing down errors the future.

Commenting could be improved -- you are currently erring on the side of overly verbose comments at times (including in your readmes), which is nonetheless better than not commenting at all, or too little! This will improve with experience, as you will begin to get a feel of what is ``common-knowledge'' among programmers, and what stylistic idioms are your own and require explanation. In general though, comments should be written to help explain a coding or syntactical decision to a user (or to your future self re-reading the code!) rather than to describe the meaning of a symbol, argument or function (that should be in the function docstring in Python for example).

It was a tough set of weeks, but I hope they have given you a good start towards further training, a quantitative masters dissertation, and ultimately a career in quantitative biology!

### (Provisional) Mark

*75*