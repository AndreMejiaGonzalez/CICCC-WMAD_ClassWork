import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JCheckBox;
import javax.swing.JTextArea;
import javax.swing.JSpinner;

public class App implements ActionListener, ItemListener {

	private JFrame frame;
	private JTextArea result;
	private JCheckBox chckbxUpperCase;
	private JCheckBox chckbxLowerCase;
	private JCheckBox chckbxNumbers;
	private JSpinner maxLengthSelect;
	private JSpinner minLengthSelect;

	Generator gen;
	CharSpace charSpace = new CharSpace();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					App window = new App();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public App() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		gen = new Generator();
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);

		JPanel titlePanel = new JPanel();
		titlePanel.setBounds(10, 11, 414, 36);
		frame.getContentPane().add(titlePanel);
		titlePanel.setLayout(null);

		JLabel lblPasswordGenerator = new JLabel("Password Generator");
		lblPasswordGenerator.setFont(new Font("Times New Roman", Font.PLAIN, 24));
		lblPasswordGenerator.setBounds(115, 0, 195, 25);
		titlePanel.add(lblPasswordGenerator);

		JPanel optionsPanel_1 = new JPanel();
		optionsPanel_1.setBounds(10, 58, 199, 70);
		frame.getContentPane().add(optionsPanel_1);
		optionsPanel_1.setLayout(null);

		JLabel lbCharSel = new JLabel("Select Possible Characters:");
		lbCharSel.setBounds(0, 0, 189, 14);
		optionsPanel_1.add(lbCharSel);

		chckbxUpperCase = new JCheckBox("Upper Case");
		chckbxUpperCase.setBounds(0, 14, 97, 23);
		chckbxUpperCase.addItemListener(this);
		optionsPanel_1.add(chckbxUpperCase);

		chckbxLowerCase = new JCheckBox("Lower Case");
		chckbxLowerCase.setBounds(0, 40, 97, 23);
		chckbxLowerCase.addItemListener(this);
		optionsPanel_1.add(chckbxLowerCase);

		chckbxNumbers = new JCheckBox("Numbers");
		chckbxNumbers.setBounds(99, 14, 97, 23);
		chckbxNumbers.addItemListener(this);
		optionsPanel_1.add(chckbxNumbers);

		JPanel optionsPanel_2 = new JPanel();
		optionsPanel_2.setBounds(225, 47, 199, 81);
		frame.getContentPane().add(optionsPanel_2);
		optionsPanel_2.setLayout(null);

		JLabel lbMinimumLength = new JLabel("Minimum Length:");
		lbMinimumLength.setBounds(0, 11, 102, 14);
		optionsPanel_2.add(lbMinimumLength);

		JLabel lbMaximumLength = new JLabel("Maximum Length:");
		lbMaximumLength.setBounds(0, 39, 102, 14);
		optionsPanel_2.add(lbMaximumLength);

		minLengthSelect = new JSpinner();
		minLengthSelect.setBounds(148, 5, 41, 20);
		optionsPanel_2.add(minLengthSelect);

		maxLengthSelect = new JSpinner();
		maxLengthSelect.setBounds(148, 33, 41, 20);
		optionsPanel_2.add(maxLengthSelect);

		JPanel resultPanel = new JPanel();
		resultPanel.setBounds(10, 158, 414, 103);
		frame.getContentPane().add(resultPanel);
		resultPanel.setLayout(null);

		result = new JTextArea();
		result.setEditable(false);
		result.setBounds(0, 15, 414, 88);
		result.setLineWrap(true);
		result.setWrapStyleWord(true);
		resultPanel.add(result);

		JLabel lbGeneratedPasswords = new JLabel("Generated Password(s):");
		lbGeneratedPasswords.setBounds(0, 0, 149, 14);
		resultPanel.add(lbGeneratedPasswords);

		JPanel buttonPanel = new JPanel();
		buttonPanel.setBounds(160, 132, 111, 23);
		frame.getContentPane().add(buttonPanel);
		buttonPanel.setLayout(null);

		JButton runButton = new JButton("Generate");
		runButton.setBounds(0, 0, 111, 23);
		runButton.addActionListener(this);
		buttonPanel.add(runButton);

	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		int minLength = (int) minLengthSelect.getValue();
		int maxLength = (int) maxLengthSelect.getValue();
		if (gen.validCharsCheck(chckbxUpperCase.isSelected(), chckbxLowerCase.isSelected(), chckbxNumbers.isSelected())
				&& gen.validLengthCheck(minLength, maxLength)) {
			result.setText(gen.generateRandomPassword(minLength, maxLength, charSpace.getCharSpace()));

		} else
			result.setText("Please select valid characters and Length");
	}

	@Override
	public void itemStateChanged(ItemEvent arg0) {
//		gen.charSpaceArrays(chckbxUpperCase.isSelected(), chckbxLowerCase.isSelected(), chckbxNumbers.isSelected());
		if (chckbxUpperCase.isSelected() && chckbxLowerCase.isSelected() && chckbxNumbers.isSelected()) {
			charSpace.setCharSpace(charSpace.possibleChars);
		} else if (chckbxUpperCase.isSelected() && chckbxLowerCase.isSelected()) {
			charSpace.setCharSpace(gen.join2Arrays(charSpace.possibleCharsArr[0], charSpace.possibleCharsArr[1]));
		} else if (chckbxUpperCase.isSelected() && chckbxNumbers.isSelected()) {
			charSpace.setCharSpace(gen.join2Arrays(charSpace.possibleCharsArr[0], charSpace.possibleCharsArr[2]));
		} else if (chckbxLowerCase.isSelected() && chckbxNumbers.isSelected()) {
			charSpace.setCharSpace(gen.join2Arrays(charSpace.possibleCharsArr[1], charSpace.possibleCharsArr[2]));
		} else if (chckbxUpperCase.isSelected()) {
			charSpace.setCharSpace(charSpace.possibleCharsArr[0]);
		} else if (chckbxLowerCase.isSelected()) {
			charSpace.setCharSpace(charSpace.possibleCharsArr[1]);
		} else if (chckbxNumbers.isSelected()) {
			charSpace.setCharSpace(charSpace.possibleCharsArr[2]);
		}
	}
}