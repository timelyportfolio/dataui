import { reactWidget } from 'reactR';
import {Histogram, BarSeries, DensitySeries, XAxis, YAxis } from '@data-ui/histogram';
import {
    Sparkline as Sparkline,
    LineSeries as SparklineLineSeries,
    PointSeries as SparklinePointSeries,
    BarSeries as SparklineBarSeries,
    HorizontalReferenceLine as HorizontalReferenceLine,
    VerticalReferenceLines as VerticalReferenceLine,
    BandLine as BandLine,
    PatternLines as PatternLines
  } from '@data-ui/sparkline';

reactWidget(
  'dataui',
  'output',
  {
    Histogram: Histogram, BarSeries: BarSeries, DensitySeries: DensitySeries, XAxis: XAxis, YAxis: YAxis,
    Sparkline: Sparkline,
    SparklineLineSeries: SparklineLineSeries,
    SparklinePointSeries: SparklinePointSeries,
    SparklineBarSeries: SparklineBarSeries,
    HorizontalReferenceLine: HorizontalReferenceLine,
    VerticalReferenceLine: VerticalReferenceLine,
    BandLine: BandLine,
    PatternLines: PatternLines
  },
  {}
);
