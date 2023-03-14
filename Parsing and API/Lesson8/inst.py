from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from time import sleep

USERNAME = 'shoker321@gmail.com'
PASSWORD = 'dflghj*&4ljngs3l'

driver = webdriver.Chrome(executable_path='./chromedriver')
driver.maximize_window()

insta_url = 'https://www.instagram.com/'
driver.get(insta_url)

sleep(10)

#accept_button = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, '//button[@class="_a9-- _a9_0"]')))
#accept_button.click()

#sleep(3)

username_field = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.NAME, 'username')))
username_field.send_keys(USERNAME)

sleep(1)

username_field = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.NAME, 'password')))
username_field.send_keys(PASSWORD)

sleep(1)

login_button = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, '//button[@class="_acan _acap _acas _aj1-"]')))
login_button.click()

save_button = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, '//button[@class="_acan _acap _acas _aj1-"]')))
save_button.click()

sleep(10)

driver.get(insta_url + 'jokilow_mlbb' + '/followers/')

sleep(60)

driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")


div = WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.CLASS, ' _ab8y  _ab94 _ab97 _ab9f _ab9k _ab9p _abcm')))
for el in div:
    print(el)

