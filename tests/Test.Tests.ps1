InModuleScope ConventionalCommits {
    Describe 'Test-ConventionalCommitHeader' {
        Context 'Default behavior' {
            It 'Should parse a strict message' {
                'fix(scope)!: description' | Test-ConventionalCommitHeader | Should -BeTrue
            }
            It 'Should parse a loose message' {
                'custom(scope)!: description' | Test-ConventionalCommitHeader | Should -BeTrue
            }
            It 'Should fail an additional modifier' {
                'fix(scope)+: description' | Test-ConventionalCommitHeader | Should -BeFalse
            }
        }
        Context 'Strict mode' {
            It 'Should fail a loose message' {
                'another(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeFalse
            }
            It 'Should parse a strict message' {
                'build(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'chore(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'ci(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'docs(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'feat(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'fix(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'perf(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'refactor(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'revert(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'style(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
            It 'Should parse a strict message' {
                'test(scope)!: description' | Test-ConventionalCommitHeader -StrictTypes | Should -BeTrue
            }
        }
        Context 'Additional modifiers' {
            It 'Should parse a minor modifier' {
                'fix(scope)+: description' | Test-ConventionalCommitHeader -AdditionalModifiers | Should -BeTrue
            }
            It 'Should parse a patch modifier' {
                'fix(scope)-: description' | Test-ConventionalCommitHeader -AdditionalModifiers | Should -BeTrue
            }
        }
    }
}