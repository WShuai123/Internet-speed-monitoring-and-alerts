#!/bin/ash

# 设置要监控的 IP 地址和阈值
target_ip="10.0.0.164"
threshold=100  # 以 kb/s 为单位

while true; do
    # 获取特定 IP 的上传和下载速度
    traffic=$(iftop -i br-lan -t -s 1 -n -N -F $target_ip -L 1 | awk '/Total send and receive rate/{print $6}')
    echo "traffic:" $traffic
    
    # 从 traffic 中提取数字和单位（如 2.2Mb）
	traffic_value=$(echo "$traffic" | sed 's/[^0-9.]//g')
	traffic_unit=$(echo "$traffic" | sed 's/[^a-zA-Z]//g')
 
	# 转换 Mb 到 kb（1Mb = 1000kb）
	if [ "$traffic_unit" = "Mb" ]; then
	    traffic_value=$(awk -v value="$traffic_value" 'BEGIN { printf "%.0f", value * 1000 }')
	fi
	
	echo "traffic_value": $traffic_value "traffic_unit": $traffic_unit
	
    # 检查总发送和接收速率是否超过阈值
    if [ "$traffic_value" -gt "$threshold" ]; then
        echo "警报：$target_ip 的总网速超过 ${threshold}kb/s"
        curl <bark推送服务器地址和推送内容>
    fi
    sleep 5  # 每5秒检查一次，可以根据需要调整
done
