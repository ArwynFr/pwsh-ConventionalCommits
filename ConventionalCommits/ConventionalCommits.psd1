@{
    Author          = 'Arwyn'
    CompanyName     = 'www.gsri.team'
    Copyright       = '(c) 2023 - ArwynFr - MIT license'

    ModuleVersion   = '0.1.0'
    GUID            = '98b57def-8002-46fe-857a-77613753ec89'
    Description     = 'A powerhsell module dedicated to parsing conventional commits messages'
    HelpInfoURI       = 'https://github.com/ArwynFr/pwsh-ConventionalCommits#readme'
    
    PrivateData       = @{
        ProjectUri = 'https://github.com/ArwynFr/pwsh-ConventionalCommits'
        LicenseUri = 'https://github.com/ArwynFr/pwsh-ConventionalCommits/blob/main/LICENSE'
    }

    RootModule      = 'ConventionalCommits.psm1'
    FunctionsToExport = @(
        'ConvertTo-ConventionalCommitHeader'
        'Test-ConventionalCommitHeader'
    )
}