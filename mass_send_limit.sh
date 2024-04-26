#!/bin/bash

# List of phone numbers to send messages to
phone_numbers=(
    "+917977960433" "+917980382572" "+917980608189" "+917981591093" "+917982043617"
    "+917982873143" "+917989186598" "+917989282914" "+917989341660" "+917990178928"
    "+917990382972" "+917994495607" "+917995313709" "+917999164403" "+918015100998"
    "+918050075497" "+918072336537" "+918072396304" "+918080159384" "+918080370343"
    "+918080729184" "+918081683240" "+918082762513" "+918088885756" "+918090113505"
    "+918097084292" "+918097250804" "+918097784500" "+918100097158" "+918100639408"
    "+918104012471" "+918104304204" "+918104455093" "+918104504471" "+918104509551"
    "+918104946247" "+918104956266" "+918108118436" "+918116355915" "+918125921689"
    "+918126746206" "+918129221995" "+918156805191" "+918169393984" "+918169865390"
    "+918180023109" "+918197139247" "+918197533997" "+918217868516" "+918219242187"
    "+918220511287" "+918240901060" "+918249296822" "+918263073734" "+918272829320"
    "+918287359507" "+918291524123" "+918291524320" "+918291572732" "+918291988205"
    "+918303071966" "+918304058731" "+918329019579" "+918329419972" "+918335938707"
    "+918337045160" "+918345952856" "+918355820677" "+918368456600" "+918369250258"
    "+918369821697" "+918383047251" "+918424028530" "+918424061860" "+918424803889"
    "+918433425323" "+918433819689" "+918433887685" "+918446182446" "+918446616715"
    "+918452056073" "+918452098224" "+918495005859" "+918519875946" "+918521039334"
    "+918540069932" "+918547529699" "+918549983692" "+918591280314" "+918591802098"
    "+918591881967" "+918595609585" "+918605634407" "+918606543562" "+918618837998"
    "+918623933393" "+918625856572" "+918639789357" "+918652172362" "+918657414209"
    "+918657846806" "+918690616629" "+918691908405" "+918691953359" "+918692874633"
    "+918741879391" "+918746042842" "+918754544178" "+918755381151" "+918762261797"
    "+918767643722" "+918767918640" "+918780047765" "+918790410166" "+918792001931"
    "+918792348179" "+918792657254" "+918792877084" "+918793231488" "+918810684005"
    "+918828370446" "+918828380015" "+918828448124" "+918828489397" "+918828986552"
    "+918838365612" "+918848471653" "+918848759294" "+918850454304" "+918851834914"
    "+918856070851" "+918866266978" "+918867559455" "+918879429416" "+918879430207"
    "+918879889314" "+918904920621" "+918920367560" "+918928016573" "+918928208493"
    "+918928636415" "+918928658289" "+918928775989" "+918928806258" "+918951291814"
    "+918953915605" "+918957858147" "+918971678997" "+918976028317" "+919004315338"
    "+919004327651" "+919004705329" "+919004928985" "+919011169168" "+919016237859"
    "+919022228528" "+919022353647" "+919028290673" "+919029903487" "+919029937140"
    "+919036111349" "+919045304479" "+919051662052" "+919069996644" "+919074356519"
    "+919076066412" "+919076462669" "+919082398449" "+919082668373" "+919082669457"
    "+919082960680" "+919082983510" "+919100877539" "+919108060782" "+919112135150"
    "+919117953251" "+919119062138" "+919120757884" "+919123057372" "+919130151507"
    "+919136347050"
)

# List to store numbers that have received the message
sent_numbers=()

# Message to send
message="Hello,
I hope this message finds you well. My name is Nitkarsh Chourasia, and I am a professional Python Developer. I am reaching out to explore potential professional connections.

If you are interested in discussing Development, collaborating on projects, or connecting with like-minded professionals, I would appreciate the opportunity to connect with you. Additionally, I am open to exploring potential job opportunities and hiring possibilities.

You can find more information about my professional background on LinkedIn: www.linkedin.com/in/nitkarshchourasia
 and GitHub: https://github.com/NitkarshChourasia

Thank you for considering my connection request. I look forward to the possibility of connecting with you and potentially collaborating for mutual growth and success.

Best regards,
Nitkarsh Chourasia"

# Function to send SMS using Termux API
send_sms() {
    local number="$1"
    termux-sms-send -n "$number" "$message"
}

# Limit the loop to run only fifty times
count=0
for number in "${phone_numbers[@]}"; do
    # Remove spaces from the phone number
    number="${number// /}"
    # Check if the number has already received the message
    if [[ ! " ${sent_numbers[@]} " =~ " $number " ]]; then
        send_sms "$number"  # Sending SMS to the current number
        echo "Message sent to $number"  # Output a message indicating SMS sent
        sent_numbers+=("$number")  # Add the number to the list of sent numbers
        ((count++))
        if [ "$count" -eq 50 ]; then
            break
        fi
    fi
    sleep 10  # Pause for 10 seconds before sending the next message
done

echo "All messages sent!"  # Output a message indicating completion
