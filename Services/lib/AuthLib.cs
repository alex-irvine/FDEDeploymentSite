using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace Services.lib
{
    public static class AuthLib
    {
        /// <summary>
        /// Creates a hash from a password an byte[] salt
        /// </summary>
        /// <param name="password">the plain text password</param>
        /// <param name="salt">the random byte array to salt</param>
        /// <returns>a byte array containing the hash</returns>
        public static byte[] CreateHash(String password, byte[] salt)
        {
            Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, salt);
            pbkdf2.IterationCount = 1000;
            return pbkdf2.GetBytes(24);
        }

        /// <summary>
        /// Creates a byte array containing the characters to salt the password with
        /// </summary>
        /// <returns>the byte array containing salt</returns>
        public static byte[] CreateSalt()
        {
            RNGCryptoServiceProvider csprng = new RNGCryptoServiceProvider();
            byte[] salt = new byte[24];
            csprng.GetBytes(salt);
            return salt;
        }

        /// <summary>
        /// Checks for differences in two byte arrays made from base 64 string pword hashes
        /// using XOR method for "Length-constant" comparison
        /// </summary>
        /// <param name="req">request hash in byte[] format</param>
        /// <param name="dat">database hash in byt[] format</param>
        /// <returns>boolean based on the difference between the two arrays</returns>
        public static bool SlowEquals(byte[] req, byte[] dat)
        {
            int diff = req.Length ^ dat.Length;
            for (int i = 0; i < req.Length && i < dat.Length; i++)
            {
                diff |= req[i] ^ dat[i];
            }
            return diff == 0;
        }

    }
}