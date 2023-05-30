InModuleScope ConventionalCommits {
    Describe 'ConvertTo-ConventionalCommitHeader' {
        Context 'Default behavior' {
            It 'Should parse a strict message' {
                $actual = 'fix(scope)!: description' | ConvertTo-ConventionalCommitHeader
                $actual.Type | Should -Be 'fix'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a loose message' {
                $actual = 'custom(scope)!: description' | ConvertTo-ConventionalCommitHeader
                $actual.Type | Should -Be 'custom'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should fail an additional modifier' {
                { 'fix(scope)+: description' | ConvertTo-ConventionalCommitHeader } | Should -Throw
            }
        }
        Context 'Strict mode' {
            It 'Should fail a loose message' {
                { 'another(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes } | Should -Throw
            }
            # 'build'; 'chore'; 'ci'; 'docs'; 'feat'; 'fix'; 'perf'; 'refactor'; 'revert'; 'style'; 'test'
            It 'Should parse a strict message' {
                $actual = 'build(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'build'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'chore(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'chore'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'ci(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'ci'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'docs(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'docs'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'feat(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'feat'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'fix(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'fix'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'perf(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'perf'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'refactor(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'refactor'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'revert(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'revert'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'style(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'style'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a strict message' {
                $actual = 'test(scope)!: description' | ConvertTo-ConventionalCommitHeader -StrictTypes
                $actual.Type | Should -Be 'test'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '!'
                $actual.Description | Should -Be 'description'
            }
        }
        Context 'Additional modifiers' {
            It 'Should parse a minor modifier' {
                $actual = 'fix(scope)+: description' | ConvertTo-ConventionalCommitHeader -AdditionalModifiers
                $actual.Type | Should -Be 'fix'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '+'
                $actual.Description | Should -Be 'description'
            }
            It 'Should parse a patch modifier' {
                $actual = 'fix(scope)-: description' | ConvertTo-ConventionalCommitHeader -AdditionalModifiers
                $actual.Type | Should -Be 'fix'
                $actual.Scope | Should -Be 'scope'
                $actual.Modifier | Should -Be '-'
                $actual.Description | Should -Be 'description'
            }
        }
    }
}