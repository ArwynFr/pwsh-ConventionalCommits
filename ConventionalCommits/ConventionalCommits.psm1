function Get-InternalStructure {
  [CmdletBinding()]
  [OutputType([hashtable])]
  param (
    [Parameter(ValueFromPipeline)]
    [string]
    $Message,

    [Parameter()]
    [switch]
    $AdditionalModifiers
  )

  Process {
    $pattern = $AdditionalModifiers ? '^(\w+)(\((\w+)\))?([!+-])?: (.*)' : '^(\w+)(\((\w+)\))?([!])?: (.*)'
    $result = $Message -match $pattern
    if (-not $result) { return $null }

    return @{
      Type        = $matches[1]
      Scope       = $matches[3]
      Modifier    = $matches[4]
      Description = $matches[5]
    }
  }
}

function Test-InternalStructure {
  [CmdletBinding()]
  [OutputType([bool])]
  param (
    [Parameter(ValueFromPipeline)]
    [hashtable]
    $Header,

    [Parameter()]
    [switch]
    $StrictTypes
  )

  Process {
    $allowed_types = @('build'; 'chore'; 'ci'; 'docs'; 'feat'; 'fix'; 'perf'; 'refactor'; 'revert'; 'style'; 'test')
    if ($null -eq $Header) { return $false }
    if (-not $StrictTypes) { return $true }
    if (-not $allowed_types.Contains($Header.Type)) { return $false }
    return $true
  }
}

function Test-ConventionalCommitHeader {
  [CmdletBinding()]
  [OutputType([bool])]
  param (
    [Parameter(ValueFromPipeline)]
    [string]
    $Message,

    [Parameter()]
    [switch]
    $StrictTypes,

    [Parameter()]
    [switch]
    $AdditionalModifiers
  )

  Process {
    return $Message | Get-InternalStructure -AdditionalModifiers:$AdditionalModifiers | Test-InternalStructure -StrictTypes:$StrictTypes
  }
}

function ConvertTo-ConventionalCommitHeader {
  [CmdletBinding()]
  [OutputType([hashtable])]
  param (
    [Parameter(ValueFromPipeline)]
    [string]
    $Message,

    [Parameter()]
    [switch]
    $StrictTypes,

    [Parameter()]
    [switch]
    $AdditionalModifiers
  )

  Process {
    $conventions = $Message | Get-InternalStructure -AdditionalModifiers:$AdditionalModifiers
    $valid = $conventions | Test-InternalStructure -StrictTypes:$StrictTypes

    if (-not $valid ) {
      throw 'Commit message does not follow the conventions'
    }

    return $conventions
  }
}
