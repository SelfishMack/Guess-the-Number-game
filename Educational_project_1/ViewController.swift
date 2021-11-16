//
//  ViewController.swift
//  Educational_project_1
//
//  Created by Владимир Макаров on 15.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
    super.viewDidLoad()
    // Создаем экземпляр сущности "Игра"
        game = Game(startValue: 1, endValue: 50, rounds: 5)
    // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        
    }
    // MARK: - Взаимодействие View - Model
    // Проверка выбранного пользователем числа
    @IBAction func checkNumber() {
        // Высчитываем очки за раунд
        game.calculateScore(with: Int(slider.value))
        // Проверяем, окончена ли игра
        if game.isGameEnded {
        showAlertWith(score: game.score)
        // Начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
            
        }
        
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        
    }
        // MARK: - Обновление View
        // Обновление текста загаданного числа
        private func updateLabelWithSecretNumber(newText: String ) {
            textLabel.text = newText
        }
            // Отображение всплывающего окна со счетом
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style:.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
            }
}
