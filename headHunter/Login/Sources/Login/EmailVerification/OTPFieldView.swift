//
//  SwiftUIView.swift
//  
//
//  Created by Bilol Sanatillayev on 19/03/24.
//

import SwiftUI
import Combine
import UIComponents


public struct OTPFieldView: View {
    
    @FocusState private var pinFocusState: FocusPin?
    @Binding private var otp: String
    @State private var pins: [String]
    
    var numberOfFields: Int
    
    enum FocusPin: Hashable {
        case pin(Int)
    }
    
    public init(numberOfFields: Int, otp: Binding<String>) {
        self.numberOfFields = numberOfFields
        self._otp = otp
        self._pins = State(initialValue: Array(repeating: "", count: numberOfFields))
    }
    
    public var body: some View {
        HStack(spacing: 15) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $pins[index])
                    .modifier(OtpModifier(pin: $pins[index]))
                    .background(content: {
                        Text(pins[index].isEmpty ? "*" : "")
                    })
                    .onChange(of: pins[index]) { newVal in
                        if newVal.count == 1 {
                            if index < numberOfFields - 1 {
                                pinFocusState = FocusPin.pin(index + 1)
                            } else {
                                 pinFocusState = nil
                            }
                        }
                        else if newVal.count == numberOfFields {
                            otp = newVal
                            updatePinsFromOTP()
                            pinFocusState = FocusPin.pin(numberOfFields - 1)
                        }
                        else if newVal.isEmpty {
                            if index > 0 {
                                pinFocusState = FocusPin.pin(index - 1)
                            }
                        }
                        updateOTPString()
                    }
                    .focused($pinFocusState, equals: FocusPin.pin(index))
                    .onTapGesture {
                        pinFocusState = FocusPin.pin(index)
                    }
            }
        }
        .onAppear {
            // Initialize pins based on the OTP string
            updatePinsFromOTP()
        }
    }
    
    private func updatePinsFromOTP() {
        let otpArray = Array(otp.prefix(numberOfFields))
        for (index, char) in otpArray.enumerated() {
            pins[index] = String(char)
        }
    }
    
    private func updateOTPString() {
        otp = pins.joined()
    }
}

struct OtpModifier: ViewModifier {
    @Binding var pin: String
    
    var textLimit = 1
    
    func limitText(_ upper: Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.AppColors.clLabelPrimary)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) { _ in limitText(textLimit) }
            .frame(width: 48, height: 48)
            .font(.system(size: 14))
            .background(
                Color.AppColors.clBackgroundTertiary.cornerRadius(8)
            )
    }
}
