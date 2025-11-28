import re

def main(path='coverage/lcov.info'):
    lf = 0
    lh = 0
    with open(path, 'r', encoding='utf-8') as f:
        for line in f:
            m = re.match(r'^LF:(\d+)', line)
            if m:
                lf += int(m.group(1))
            m = re.match(r'^LH:(\d+)', line)
            if m:
                lh += int(m.group(1))
    if lf == 0:
        print('No LF found')
    else:
        pct = lh / lf * 100
        print(f'LF={lf} LH={lh} Coverage={pct:.2f}%')

if __name__ == '__main__':
    main()
