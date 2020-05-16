namespace YunXun.Jwt
{
    using System.Collections.Generic;

    /// <summary>
    /// Defines the <see cref="IJwt" />.
    /// </summary>
    public interface IJwt
    {
        /// <summary>
        /// The GetToken.
        /// </summary>
        /// <param name="Clims">The Clims<see cref="Dictionary{string, string}"/>.</param>
        /// <returns>The <see cref="string"/>.</returns>
        string GetToken(Dictionary<string, string> Clims);

        /// <summary>
        /// The ValidateToken.
        /// </summary>
        /// <param name="Token">The Token<see cref="string"/>.</param>
        /// <param name="Clims">The Clims<see cref="Dictionary{string, string}"/>.</param>
        /// <returns>The <see cref="bool"/>.</returns>
        bool ValidateToken(string Token, out Dictionary<string, string> Clims);
    }
}
