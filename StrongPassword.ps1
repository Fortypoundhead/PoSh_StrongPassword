function Generate-StrongPassword {
    param(
        [int]$length = 16,
        [string]$specialChars = "!@#$%^&*()-_=+[]{}|;:',.<>?/~"
    )

    # Define character sets
    $lowercase = "abcdefghijklmnopqrstuvwxyz"
    $uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    $numbers = "0123456789"

    # Combine all characters
    $allChars = $lowercase + $uppercase + $numbers + $specialChars

    # Initialize an empty password
    $password = @()

    # Ensure at least one character from each set is included
    $password += ($lowercase | Get-Random -Count 1)
    $password += ($uppercase | Get-Random -Count 1)
    $password += ($numbers | Get-Random -Count 1)
    $password += ($specialChars | Get-Random -Count 1)

    # Fill the rest of the password length with random characters from all sets
    for ($i = $password.Length; $i -lt $length; $i++) {
        $password += ($allChars | Get-Random -Count 1)
    }

    # Shuffle the password array to randomize the order
    $password = $password | Sort-Object {Get-Random}

    # Convert the password array to a string and return it
    return -join $password
}

# Generate a strong password with the default length of 16 characters
$generatedPassword = Generate-StrongPassword
Write-Output "Generated Password: $generatedPassword"