//
//  CaesarCipher.swift
//  encryptPrac2
//
//  Created by Christopher Johnson on 7/2/21.
//

import Foundation
import UIKit
//import BigInt

let alphabet = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !@#$%^&*().,<>1234567890_-=+~`")

func encryptText(message: String, shift: Int) -> String {
        
        var result = ""
        let len = alphabet.count

        for c in message {
        if (alphabet.contains(c)){
            if let i = alphabet.firstIndex(of: c){
                let index: Int = alphabet.distance(from: alphabet.startIndex, to:i)
                result.append(alphabet[(index + 4) % len])
            }
        }
        }
        return result
    }


struct CaesarCipher{
    

    var shift: Int
    var inputFieldCS: UITextField
    var cipher_textCS: UILabel
    var plain_textCS: UILabel
    var decrypted_textCS: UILabel
    





    func decryptText() -> String {
            let len = alphabet.count
            var decrypted = ""
            let cipher = cipher_textCS.text
            var desig = ""

            if let unwrapped = cipher{
            desig = unwrapped
            }
            
            else{
            print("cipher text is missing!")
            }


            for c in desig {
                if (alphabet.contains(c)){
                    if let i = alphabet.firstIndex(of: c){
                        let index: Int = alphabet.distance(from: alphabet.startIndex, to:i)
                        if(index-shift < 0){
                            decrypted.append(alphabet[(len - abs(index-shift)) % len])
                        }
                        
                        else {
                            decrypted.append(alphabet[(index - shift) % len])
                        }
                        
                    }
                }
            }

                
         return decrypted

        }
    
    

}


