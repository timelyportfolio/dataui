import { reactWidget } from 'reactR';
import { Histogram, BarSeries, DensitySeries, XAxis, YAxis } from '@data-ui/histogram';

reactWidget(
  'dataui',
  'output',
  {Histogram: Histogram, BarSeries: BarSeries, DensitySeries: DensitySeries, XAxis: XAxis, YAxis: YAxis},
  {}
);
