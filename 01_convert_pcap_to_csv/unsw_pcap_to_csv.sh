pcapFiles=("16-09-23")

for file in ${pcapFiles[@]}; do
	sourceFile="../../pcap_unsw/${file}.pcap"
	destinationFile="../../csv_from_pcap/${file}.csv"
	echo "Extracting pcap from ${sourceFile} to ${destinationFile}"
	# some ICMP packets with failures have ip.proto==17 and ip.proto==1, exclude them!
	tshark -r $sourceFile -Y "(ip.proto == 6 or ip.proto == 17) and ip.proto != 1" -T fields -e frame.number -e frame.time_epoch -e frame.len -e eth.src -e eth.dst -e ip.src -e ip.dst -e ip.proto -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport -E header=y -E separator=, > $destinationFile
	# some packets lack a port (reassembled or fragmented). remove them.
	sed -i -e 's/.*,,,,//g' $destinationFile
	# each packet has either tcp ports OR udp ports. we extract both. then we remove the seperator of the missing ones:
	sed -i -e 's/,,//g' $destinationFile
	# set CSV header
	csvHeader="Packet_ID,TIME,Size,MAC_source,MAC_destination,IP_source,IP_destination,Layer_4_protocol,Port_source,Port_destination"
	sed -i "1 s/.*/${csvHeader}/" $destinationFile
done


