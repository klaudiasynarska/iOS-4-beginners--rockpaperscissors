//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import SwiftUI

struct GameView: View {
	
	@EnvironmentObject var viewModel: GameViewModel
	
	var body: some View {
		ZStack {
			Color.black.edgesIgnoringSafeArea(.all)
			VStack(spacing: 5) {
                OpponentView(opponentValue: viewModel.opponentOption)
                    .overlay(alignment: .topLeading) { Text(viewModel.opponentPoints).padding().foregroundColor(.white) }
                PlayerView(selection: $viewModel.playerOption, values: viewModel.possibleOptions)
                    .overlay(alignment: .topLeading) { Text(viewModel.playerPoints).padding().foregroundColor(.white) }
			}
            Button(viewModel.buttonTitle) {
                viewModel.fightPressed()
            }
				.font(.largeTitle)
				.tint(.green)
				.buttonStyle(.borderedProminent)
				.disabled(viewModel.playerOption == nil)
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
	}
}
