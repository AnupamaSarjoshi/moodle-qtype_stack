@qtype @qtype_stack
Feature: Test restoring a backup including STACK questions
  In order to reuse all the existing shared STACK questions
  As an admin
  I need to restore the STACK demo course.

  Background:
    Given the following "courses" exist:
      | fullname            | shortname |
      | Demonstrating STACK | STACK     |
    And I log in as "admin"
    And I navigate to "Courses > Restore course" in site administration

  @javascript @_file_upload
  Scenario: Restore the STACK demo course in Moodle ≤ 4.3.
    Given the site is running Moodle version 4.3 or lower
    When I click on "Manage backup files" "button" in the "//h2[contains(., 'User private backup area')]/following-sibling::div[1]" "xpath_element"
    And I upload "question/type/stack/samplequestions/STACK-syntax-quiz.mbz" file to "Files" filemanager
    And I press "Save changes"
    And I restore "STACK-syntax-quiz" backup into "Demonstrating STACK" course using this options:
    And I am on "Demonstrating STACK" course homepage
    Then I should see "Stack Syntax Quiz"
    And I am on the "Stack Syntax Quiz" "mod_quiz > edit" page
    And I should see "Syntax-21-Numbers-Greek"

  @javascript @_file_upload
  Scenario: Restore the STACK demo course in Moodle ≥ 4.4.
    Given the site is running Moodle version 4.4 or higher
    When I press "Manage course backups"
    And I upload "question/type/stack/samplequestions/STACK-syntax-quiz.mbz" file to "Files" filemanager
    And I press "Save changes"
    And I restore "STACK-syntax-quiz" backup into "Demonstrating STACK" course using this options:
    And I am on "Demonstrating STACK" course homepage
    Then I should see "Stack Syntax Quiz"
    And I am on the "Stack Syntax Quiz" "mod_quiz > edit" page
    And I should see "Syntax-21-Numbers-Greek"
