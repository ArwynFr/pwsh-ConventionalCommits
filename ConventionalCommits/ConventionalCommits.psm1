function ConvertTo-ConventionalCommitHeader {
  [CmdletBinding()]
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

  $allowed_types = @('build'; 'chore'; 'ci'; 'docs'; 'feat'; 'fix'; 'perf'; 'refactor'; 'revert'; 'style'; 'test')
  $pattern = $AdditionalModifiers ? '^(\w+)(\((\w+)\))?([!+-])?: (.*)' : '^(\w+)(\((\w+)\))?([!])?: (.*)'
  $result = $Message -match $pattern

  if (-not $result) {
    throw 'Commit message header does not follow the conventions'
  }

  $conventions = @{
    Type        = $matches[1]
    Scope       = $matches[3]
    Modifier    = $matches[4]
    Description = $matches[5]
  }

  if ($StrictTypes -and (-not $allowed_types.Contains($conventions.Type))) {
    throw 'Commit message header type is not valid'
  }

  return $conventions
}
