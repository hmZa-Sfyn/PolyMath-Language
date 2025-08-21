# Define directories
$baseDir = "C:\Program Files\PolyMathLang"
$srcDir  = Join-Path $baseDir "src"

# Create base directory if not exists
if (!(Test-Path -Path $baseDir)) {
    New-Item -Path $baseDir -ItemType Directory -Force
    Write-Output "Created directory: $baseDir"
}

# Create src directory if not exists
if (!(Test-Path -Path $srcDir)) {
    New-Item -Path $srcDir -ItemType Directory -Force
    Write-Output "Created directory: $srcDir"
}

# Copy all files and folders from current directory (./) to $baseDir
Copy-Item -Path ".\*" -Destination $baseDir -Recurse -Force
Write-Output "All contents copied to $baseDir"

# Add $baseDir to the system PATH if not already there
$existingPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")

if ($existingPath -notlike "*$baseDir*") {
    $newPath = $existingPath + ";" + $baseDir
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
    Write-Output "Added $baseDir to system PATH"
} else {
    Write-Output "$baseDir already exists in system PATH"
}

Write-Output "Setup complete. Restart your terminal for PATH changes to take effect."
